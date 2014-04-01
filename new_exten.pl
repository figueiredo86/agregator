#!/usr/bin/perl -w

eval 'require "/root/projetos/perl/agregator/gen_files.pl"';

sub main {
 &load_modules();
 &properties();
 &open_dbconnection();
 &get_details();
 &close_dbconnection();
 &move_cfg_files();
}

sub load_modules {
 use Config::Tiny;
 use DBI;
}

sub properties {
 $cfg = Config::Tiny->new;
 $cfg = Config::Tiny->read("/root/projetos/perl/agregator/properties.ini");
 
 #Definicao de variaveis para o banco de dados
 $db_name = $cfg->{db}->{name};
 $db_host = $cfg->{db}->{host};
 $db_username = $cfg->{db}->{username};
 $db_password = $cfg->{db}->{password};
}

sub get_details {
 if (!open "arquivo", "ramais.csv") {
  die "Não foi possível abrir o arquivo ramais.csv\n"
 }

 while (<arquivo>) {
  chomp;
  @user_details = split /,/, $_;
  $exten_company = $user_details[0];
  $exten_name = $user_details[1];
  $exten_username = $user_details[2];
  $exten_password = $user_details[3];
  $exten_email = $user_details[4];
  $exten_mac = $user_details[5];

  $get_macaddr = $dbo->prepare("
   select id from company where 
   name like '$exten_company'
  ");
  
  $get_macaddr->execute();
  
  while (@is_macaddr = $get_macaddr->fetchrow_array) {
   $exten_cid = $is_macaddr[0];
  }
  $add_user = $dbo->prepare("
   insert into user_exten (id,username,exten,password,email,company_id,mac_addr,accountcode,callerid) values (
   '',
   '$exten_name',
   '$exten_username',
   '$exten_password',
   '$exten_email',
   '$exten_cid',
   '$exten_mac',
   '$exten_username',
   '$exten_name'
   ) 
  ");

  $setmac_unavail = $dbo->prepare("
   update ip_phone set 
   available = 0,
   exten='$exten_username',
   company_id='$exten_cid' where
   mac_addr = '$exten_mac'
  "); 

  $add_user->execute();
  $setmac_unavail->execute();
 
  &create_files(); 
 }
 close "arquivo";
}

sub open_dbconnection {
 $dbo = DBI->connect("DBI:mysql:database=$db_name;host=$db_host","$db_username","$db_password") or die ("Falha ao se conectar ao banco $db_name");
}

sub close_dbconnection {
 $dbo->disconnect();
};

sub move_cfg_files {
 print "Movendo os arquivos de provisionamento para o diretório: " .$cfg->{tftp}->{path}. "\n";
 @path_content=system("ls","/root/projetos/perl/agregator/*.cfg");
 system("cp",'/root/projetos/perl/agregator/*.cfg',"$cfg->{tftp}->{path}");
 print "Cópia realizada com sucesso. Ambiente pronto para o provisionamento.\nObrigado.\n\n"
};

&main();
