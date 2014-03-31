Este documento refere-se ao script de automação dos ramais. 

Primeiramente, deverá ser executado o script 'list_availmac.pl'. Este script irá mostrar o fabricante, modelo e macaddress dos aparelhos disponíveis para uso.
(##IMPORTANTE - ESSE SCRIPT AINDA NÃO EXISTE)

O arquivo terá o seguinte formato:

company_name,username,user,password,macaddr

Esse arquivo será lido, e para cada usuário encontrado, será realizado um update no banco com as informações do usuário e
também setando o mac addres como indisponível nas tabelas ip_phone e device

## Importante

Para isso acontecer, as tabelas ip_phone e device precisam estar corretamente preenchidas
