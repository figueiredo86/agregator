#!/usr/bin/perl -w

sub create_sip_file {
 $get_user=$dbo->prepare("
  select e.*,c.bind_addr from user_exten e, company c where
  e.exten = '$exten_username' and
  e.username = '$exten_name' and
  c.id=$exten_cid
 ");
 
 $get_user->execute();

=coment
O script não definirá nomes para as posições do array criado no select. Então a consulta (e entendimento)
ficará no comentário do código. Segue:
Posição			Parâmetro
0			id
1			username
2			exten
3 			password
4			email
5			company_id
6			mac_addr
7			accountcode
8			callgroup
9			pickupgroup
10			callerid
11			context
12			host
13			nat
14			port
15			exten_type(type)
16			qualify
17			allowtransfer
18			call_limit
19			deny
20		i	permit
21			bindaddr
=cut

 while (@user_data=$get_user->fetchrow_array) {
  open (my $sip_exten, '>>', '/root/projetos/perl/yealink_provisioner/sip_extensions.conf') or die "arquivo /projetos/perl/yealink_provisioner/sip_extensions.conf não existe ou sem permissão";
  print $sip_exten "\[$exten_username\]"."\n";
  print $sip_exten "accountcode=$user_data[7]"."\n";
  print $sip_exten "callgroup=$user_data[8]"."\n";
  print $sip_exten "pickupgroup=$user_data[9]"."\n";
  print $sip_exten "callerid=$user_data[10]"."\n";
  print $sip_exten "context=$user_data[11]"."\n";
  print $sip_exten "host=$user_data[12]"."\n";
  print $sip_exten "nat=$user_data[13]"."\n";
  print $sip_exten "port=$user_data[14]"."\n";
  print $sip_exten "md5secret=$user_data[3]"."\n";
  print $sip_exten "type=$user_data[15]"."\n";
  print $sip_exten "qualify=$user_data[16]"."\n";
  print $sip_exten "allowtransfer=$user_data[17]"."\n";
  print $sip_exten "call-limit=$user_data[18]"."\n";
  print $sip_exten "deny=$user_data[19]"."\n";
  print $sip_exten "permit=$user_data[20]"."\n\n";
  return (@user_data);
 }
}
