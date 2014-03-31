#!/usr/bin/perl -w

sub create_prov_file {
 system("touch","/root/projetos/perl/yealink_provisioner/$exten_mac.cfg");
 open (my $prov_file,">","/root/projetos/perl/yealink_provisioner/$exten_mac.cfg") or die "arquivo /root/projetos/perl/yealink_provisioner/'$exten_mac'.cfg não existe ou sem permissão";
 print $prov_file "#!version:1.0.0.1\n
 
 ##File header \"#!version:1.0.0.1\" can not be edited or deleted, and must be placed in the first line.##
 ##This template file is applicable to SIP-T28P/T26P/T22P/T20P/T21P/T19P/T46G/T42G/T41P IP phones running firmware version 72 or later.##
 ##For more information on configuration parameters, refer to Yealink_SIP-T2_Series_T19P_T4_Series_IP_Phones_Auto_Provisioning_Guide.##
 
 #######################################################################################
 ##                           Account1 Basic Settings                                 ##       
 #######################################################################################
 account.1.enable = 1
 account.1.label = $user_data[10]
 account.1.display_name = $user_data[10]
 account.1.auth_name = $user_data[2]
 account.1.user_name = $user_data[2]
 account.1.password = $user_data[3]
 account.1.outbound_proxy_enable = 1 
 account.1.outbound_host =  $user_data[21]
 account.1.outbound_port = $user_data[14]
 
 ##It configures the local SIP port for account 1. The default value is 5060.
 account.1.sip_listen_port = 
 
 ##It configures the transport type for account 1. 0-UDP,1-TCP,2-TLS,3-DNS-NAPTR
 ##The default value is 0.
 account.1.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.1.reregister_enable = 
 account.1.naptr_build = 
 account.1.fallback.redundancy_type = 
 account.1.fallback.timeout = 
 account.1.sip_server.1.address = $user_data[21]
 account.1.sip_server.1.port = $user_data[14]
 account.1.sip_server.1.expires = 1800
 account.1.sip_server.1.retry_counts = 
 account.1.sip_server.1.failback_mode = 
 account.1.sip_server.1.failback_timeout = 
 account.1.sip_server.1.register_on_enable = 
 
 account.1.sip_server.2.address =
 account.1.sip_server.2.port = 
 account.1.sip_server.2.expires = 
 account.1.sip_server.2.retry_counts = 
 account.1.sip_server.2.failback_mode = 
 account.1.sip_server.2.failback_timeout = 
 account.1.sip_server.2.register_on_enable = 
 
 account.1.dns_cache_type = 
 account.1.dns_cache_a.1.name =
 account.1.dns_cache_a.1.ip =
 account.1.dns_cache_a.1.ttl = 
 account.1.dns_cache_srv.1.name =
 account.1.dns_cache_srv.1.port = 
 account.1.dns_cache_srv.1.priority = 
 account.1.dns_cache_srv.1.target =
 account.1.dns_cache_srv.1.weight = 
 account.1.dns_cache_srv.1.ttl = 
 account.1.dns_cache_naptr.1.name =
 account.1.dns_cache_naptr.1.flags =
 account.1.dns_cache_naptr.1.order = 
 account.1.dns_cache_naptr.1.preference = 
 account.1.dns_cache_naptr.1.replace =
 account.1.dns_cache_naptr.1.service =
 account.1.dns_cache_naptr.1.ttl = 
 
 account.1.dns_cache_type = 
 account.1.dns_cache_a.2.name =
 account.1.dns_cache_a.2.ip =
 account.1.dns_cache_a.2.ttl = 
 account.1.dns_cache_srv.2.name =
 account.1.dns_cache_srv.2.port = 
 account.1.dns_cache_srv.2.priority = 
 account.1.dns_cache_srv.2.target =
 account.1.dns_cache_srv.2.weight = 
 account.1.dns_cache_srv.2.ttl = 
 account.1.dns_cache_naptr.2.name =
 account.1.dns_cache_naptr.2.flags =
 account.1.dns_cache_naptr.2.order = 
 account.1.dns_cache_naptr.2.preference = 
 account.1.dns_cache_naptr.2.replace =
 account.1.dns_cache_naptr.2.service =
 account.1.dns_cache_naptr.2.ttl = 
 
 account.1.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 ##It configures the SIP server type for account X.0-Default,2-BroadSoft,4-Cosmocom,6-UCAP
 ##The default value is 0.
 
 account.1.sip_server_type = 
 
 account.1.unregister_on_reboot = 
 account.1.sip_trust_ctrl = 
 account.1.proxy_require = 
 account.1.srv_ttl_timer_enable = 
 account.1.register_mac = 
 account.1.register_line = 
 account.1.reg_fail_retry_interval = 
 
 ######################################################################################
 ##                     NAT Settings                                                 ##
 ######################################################################################
 ##It enables or disables the NAT traversal for account X.0-Disabled,1-Enabled
 ##The default value is 0.
 account.1.nat.nat_traversal = 
 
 ##It configures the IP address or domain name of the STUN server for account X.
 ##The default value is blank.
 account.1.nat.stun_server = 
 
 ##It configures the port of the STUN server for account X.
 ##The default value is 3478.
 account.1.nat.stun_port = 
 
 ##It configures the type of keep-alive packets sent by the phone to the NAT device to keep the communication port open so that NAT can continue to function for account X.
 ##0-Dsiabled,1-Default: the phone sends UDP packets to the server,2-Option: the phone sends SIP OPTION packets to the server,3-Notify: the phone sends SIP NOTIFY packets to the server.
 ##The default value is 1.
 account.1.nat.udp_update_enable = 
 
 ##It configures the keep-alive interval (in seconds) for account X.
 ##The default value is 30.Integer from 15 to 2147483647
 account.1.nat.udp_update_time = 
 
 ##It enables or disables NAT Rport feature for account X.0-Disabled,1-Enabled
 ##The default value is 0.
 account.1.nat.rport = 
 
 #######################################################################################
 ##                            Account1 Advance Settings                              ##       
 #######################################################################################
 account.1.advanced.timer_t1 = 
 account.1.advanced.timer_t2 = 
 account.1.advanced.timer_t4 = 
 
 ##It configures the voice mail number for account X.
 ##The default value is blank.
 voice_mail.number.1 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 ##It enables or disables the phone to subscribe the message waiting indicator for account X.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.subscribe_mwi = 
 
 ##It configures the interval (in seconds) of MWI subscription for account X.
 ##The default value is 3600.
 account.1.subscribe_mwi_expires = 
 
 ##It enables or disables the phone to subscribe to the voice mail number for the message waiting indicator for account X.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.subscribe_mwi_to_vm = 
 
 ##It configures the period (in seconds) of ACD subscription for account X.
 ##The default value is 1800.
 account.1.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 ##It configures the BLF List URI to monitor a list of users for account X.
 ##The default value is blank.
 account.1.blf.blf_list_uri = 
 
 ##It configures the feature access code for directed call pickup (default: *97) for account X.
 ##The default value is blank.
 account.1.blf_list_code = 
 
 ##It configures the feature access code for directed call pickup with barge-in (default: *33) for account X.
 ##The default value is blank.
 account.1.blf_list_barge_in_code = 
 
 ##It configures the period (in seconds) of the BLF subscription for account X.
 ##The default value is 1800.Integer from 30 to 2147483647.
 account.1.blf.subscribe_period = 
 
 ##It configures the event of the BLF subscription for account X.0-Dialog,1-Presence.
 ##The default value is 0.
 account.1.blf.subscribe_event =
 
 ##It enables or disables the phone to handle NOTIFY messages out of the BLF dialog for account X.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 ##It enables or disables Broadsoft SCA feature for account X.0-Disabled,1-Broadsoft SCA.
 ##The default value is 0.
 account.1.shared_line = 
 
 ##It configures the BLA number for account X.
 ##The default value is blank.
 account.1.bla_number = 
 
 ##It configures the period (in seconds) of BLA subscription for account X. 
 ##The default value is 300.Integer from 60 to 7200
 account.1.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.1.codec.1.enable = 
 account.1.codec.1.payload_type = 
 account.1.codec.1.priority = 
 account.1.codec.1.rtpmap = 
 
 account.1.codec.2.enable = 
 account.1.codec.2.payload_type = 
 account.1.codec.2.priority = 
 account.1.codec.2.rtpmap = 
 
 account.1.codec.3.enable = 
 account.1.codec.3.payload_type = 
 account.1.codec.3.priority = 
 account.1.codec.3.rtpmap = 
 
 account.1.codec.4.enable = 
 account.1.codec.4.payload_type = 
 account.1.codec.4.priority = 
 account.1.codec.4.rtpmap = 
 
 account.1.codec.5.enable = 
 account.1.codec.5.payload_type = 
 account.1.codec.5.priority = 
 account.1.codec.5.rtpmap = 
 
 account.1.codec.6.enable = 
 account.1.codec.6.payload_type = 
 account.1.codec.6.priority = 
 account.1.codec.6.rtpmap = 
 
 account.1.codec.7.enable = 
 account.1.codec.7.payload_type = 
 account.1.codec.7.priority = 
 account.1.codec.7.rtpmap = 
 
 account.1.codec.8.enable = 
 account.1.codec.8.payload_type = 
 account.1.codec.8.priority = 
 account.1.codec.8.rtpmap = 
 
 account.1.codec.9.enable = 
 account.1.codec.9.payload_type = 
 account.1.codec.9.priority = 
 account.1.codec.9.rtpmap = 
 
 account.1.codec.10.enable = 
 account.1.codec.10.payload_type = 
 account.1.codec.10.priority = 
 account.1.codec.10.rtpmap = 
 
 account.1.codec.11.enable = 
 account.1.codec.11.payload_type = 
 account.1.codec.11.priority = 
 account.1.codec.11.rtpmap = 
 
 account.1.codec.12.enable = 
 account.1.codec.12.payload_type = 
 account.1.codec.12.priority = 
 account.1.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 ##It configures whether to use voice encryption service for account X.0-Disabled,1-Optional,2-Compulsory.
 ##The default value is 0.
 account.1.srtp_encryption = 
 
 ##It configures the RTP packet time for account X.0 (Disabled), 10, 20, 30, 40, 50 or 60.
 ##The default value is 20.
 account.1.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ##       
 #######################################################################################
 account.1.send_anonymous_code = 
 account.1.anonymous_call = 
 account.1.anonymous_call_oncode = 
 account.1.anonymous_call_offcode = 
 account.1.reject_anonymous_call = 
 account.1.anonymous_reject_oncode = 
 account.1.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##       
 #######################################################################################
 ##It enables or disables the phone to pick up a call according to the SIP header of dialog-info for account X.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.dialoginfo_callpickup = 
 
 ##It configures the group pickup code for account X.
 ##The default value is blank.
 account.1.group_pickup_code = 
 
 ##It configures the directed pickup code for account X.
 ##The default value is blank.
 account.1.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.1.dtmf.type = 1
 account.1.dtmf.info_type = 
 account.1.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 ##It enables or disables the distinctive ringtones by the Alert-Info SIP header for account X.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.alert_info_url_enable = 
 
 account.1.ringtone.ring_type = 
 
 ###Only for T46G Model
 ##It enables or disables the phone to download the picture information for account X when receiving an incoming call or during a call.0-Disabled,1-Enabled.
 ##The default value is 0.
 account.1.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 ##It configures the conference type for account X.0-Local Conference,2-Network Conference.
 ##The default value is 0.
 account.1.conf_type = 
 
 ##It configures the network conference URI for account X.
 ##The default value is blank.
 account.1.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.1.cid_source = 
 account.1.cid_source_privacy = 
 account.1.cid_source_ppi = 
 account.1.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.1.session_timer.enable = 
 account.1.session_timer.expires = 
 account.1.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 ##It configures the way on how the phone processes Music On Hold when placing an active call on hold for account X.
 ##0-Calling the music server before holding
 ##1-Calling the music server after holding
 ##The default value is 0.
 account.1.music_on_hold_type = 
 
 ##It configures the URI of the Music On Hold server for account X.
 ##The default value is blank.
 account.1.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.1.auto_answer = 
 account.1.missed_calllog = 
 account.1.100rel_enable = 
 account.1.enable_user_equal_phone = 
 account.1.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##       
 #######################################################################################
 account.1.dnd.enable =
 account.1.dnd.on_code = 
 account.1.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.1.always_fwd.enable = 
 account.1.always_fwd.target = 
 account.1.always_fwd.off_code =
 account.1.always_fwd.on_code =
 account.1.busy_fwd.enable =          
 account.1.busy_fwd.target =         
 account.1.busy_fwd.off_code =
 account.1.busy_fwd.on_code =
 account.1.timeout_fwd.enable = 
 account.1.timeout_fwd.target =
 account.1.timeout_fwd.timeout =  
 account.1.timeout_fwd.off_code =
 account.1.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.1.hoteling.enable = 
 account.1.hoteling.user_id = 
 account.1.hoteling.password = 
 account.1.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.1.acd.enable = 
 account.1.acd.unavailable_reason_enable = 
 account.1.acd.available = 
 account.1.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.1.reason_code.1 =
 account.1.reason_code_name.1 = 
 account.1.bw_disp_code.1 =
 account.1.bw_disp_code_name.1 =
 account.1.supervisor_info_code.1 =
 account.1.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.1.call_center.call_info_enable = 
 account.1.call_center.show_call_info_time = 
 account.1.call_center.disp_code_enable = 
 account.1.call_center.trace_enable = 
 account.1.call_center.emergency_enable = 
 account.1.call_center.queue_status_enable = 
 account.1.call_center.queue_status_light_enable = 
 
 #######################################################################################
 ##                           Account2 Basic Settings                                 ##       
 #######################################################################################
 account.2.enable = 
 account.2.label = 
 account.2.display_name =
 account.2.auth_name = 
 account.2.user_name = 
 account.2.password = 
 account.2.outbound_proxy_enable = 
 account.2.outbound_host = 
 account.2.outbound_port = 
 account.2.sip_listen_port = 
 account.2.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.2.reregister_enable = 
 account.2.naptr_build = 
 account.2.fallback.redundancy_type = 
 account.2.fallback.timeout = 
 account.2.sip_server.1.address =
 account.2.sip_server.1.port = 
 account.2.sip_server.1.expires = 
 account.2.sip_server.1.retry_counts = 
 account.2.sip_server.1.failback_mode = 
 account.2.sip_server.1.failback_timeout = 
 account.2.sip_server.1.register_on_enable = 
 
 account.2.sip_server.2.address =
 account.2.sip_server.2.port = 
 account.2.sip_server.2.expires = 
 account.2.sip_server.2.retry_counts = 
 account.2.sip_server.2.failback_mode = 
 account.2.sip_server.2.failback_timeout = 
 account.2.sip_server.2.register_on_enable = 
 
 account.2.dns_cache_type = 
 account.2.dns_cache_a.1.name =
 account.2.dns_cache_a.1.ip =
 account.2.dns_cache_a.1.ttl = 
 account.2.dns_cache_srv.1.name =
 account.2.dns_cache_srv.1.port = 
 account.2.dns_cache_srv.1.priority = 
 account.2.dns_cache_srv.1.target =
 account.2.dns_cache_srv.1.weight = 
 account.2.dns_cache_srv.1.ttl = 
 account.2.dns_cache_naptr.1.name =
 account.2.dns_cache_naptr.1.flags =
 account.2.dns_cache_naptr.1.order = 
 account.2.dns_cache_naptr.1.preference = 
 account.2.dns_cache_naptr.1.replace =
 account.2.dns_cache_naptr.1.service =
 account.2.dns_cache_naptr.1.ttl = 
 
 account.2.dns_cache_type = 
 account.2.dns_cache_a.2.name =
 account.2.dns_cache_a.2.ip =
 account.2.dns_cache_a.2.ttl = 
 account.2.dns_cache_srv.2.name =
 account.2.dns_cache_srv.2.port = 
 account.2.dns_cache_srv.2.priority = 
 account.2.dns_cache_srv.2.target =
 account.2.dns_cache_srv.2.weight = 
 account.2.dns_cache_srv.2.ttl = 
 account.2.dns_cache_naptr.2.name =
 account.2.dns_cache_naptr.2.flags =
 account.2.dns_cache_naptr.2.order = 
 account.2.dns_cache_naptr.2.preference = 
 account.2.dns_cache_naptr.2.replace =
 account.2.dns_cache_naptr.2.service =
 account.2.dns_cache_naptr.2.ttl = 
 
 account.2.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 account.2.sip_server_type = 
 account.2.unregister_on_reboot = 
 account.2.sip_trust_ctrl = 
 account.2.proxy_require = 
 account.2.srv_ttl_timer_enable = 
 account.2.register_mac = 
 account.2.register_line = 
 account.2.reg_fail_retry_interval = 
 
 #########################################################################
 ##                     NAT Settings                                    ##
 #########################################################################
 account.2.nat.nat_traversal = 
 account.2.nat.stun_server = 
 account.2.nat.stun_port = 
 account.2.nat.udp_update_enable = 
 account.2.nat.udp_update_time = 
 account.2.nat.rport = 
 
 #######################################################################################
 ##                            Account2 Advance Settings                              ##       
 #######################################################################################
 account.2.advanced.timer_t1 = 
 account.2.advanced.timer_t2 = 
 account.2.advanced.timer_t4 = 
 
 voice_mail.number.2 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 account.2.subscribe_mwi = 
 account.2.subscribe_mwi_expires = 
 account.2.subscribe_mwi_to_vm = 
 account.2.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 
 account.2.blf.blf_list_uri = 
 account.2.blf_list_code = 
 account.2.blf_list_barge_in_code = 
 account.2.blf.subscribe_period = 
 account.2.blf.subscribe_event =
 account.2.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 account.2.shared_line = 
 account.2.bla_number = 
 account.2.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.2.codec.1.enable = 
 account.2.codec.1.payload_type = 
 account.2.codec.1.priority = 
 account.2.codec.1.rtpmap = 
 
 account.2.codec.2.enable = 
 account.2.codec.2.payload_type = 
 account.2.codec.2.priority = 
 account.2.codec.2.rtpmap = 
 
 account.2.codec.3.enable = 
 account.2.codec.3.payload_type = 
 account.2.codec.3.priority = 
 account.2.codec.3.rtpmap = 
 
 account.2.codec.4.enable = 
 account.2.codec.4.payload_type = 
 account.2.codec.4.priority = 
 account.2.codec.4.rtpmap = 
 
 account.2.codec.5.enable = 
 account.2.codec.5.payload_type = 
 account.2.codec.5.priority = 
 account.2.codec.5.rtpmap = 
 
 account.2.codec.6.enable = 
 account.2.codec.6.payload_type = 
 account.2.codec.6.priority = 
 account.2.codec.6.rtpmap = 
 
 account.2.codec.7.enable = 
 account.2.codec.7.payload_type = 
 account.2.codec.7.priority = 
 account.2.codec.7.rtpmap = 
 
 account.2.codec.8.enable = 
 account.2.codec.8.payload_type = 
 account.2.codec.8.priority = 
 account.2.codec.8.rtpmap = 
 
 account.2.codec.9.enable = 
 account.2.codec.9.payload_type = 
 account.2.codec.9.priority = 
 account.2.codec.9.rtpmap = 
 
 account.2.codec.10.enable = 
 account.2.codec.10.payload_type = 
 account.2.codec.10.priority = 
 account.2.codec.10.rtpmap = 
 
 account.2.codec.11.enable = 
 account.2.codec.11.payload_type = 
 account.2.codec.11.priority = 
 account.2.codec.11.rtpmap = 
 
 account.2.codec.12.enable = 
 account.2.codec.12.payload_type = 
 account.2.codec.12.priority = 
 account.2.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 account.2.srtp_encryption = 
 account.2.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ##       
 #######################################################################################
 account.2.send_anonymous_code = 
 account.2.anonymous_call = 
 account.2.anonymous_call_oncode = 
 account.2.anonymous_call_offcode = 
 account.2.reject_anonymous_call = 
 account.2.anonymous_reject_oncode = 
 account.2.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##       
 #######################################################################################
 account.2.dialoginfo_callpickup = 
 account.2.group_pickup_code = 
 account.2.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.2.dtmf.type = 
 account.2.dtmf.info_type = 
 account.2.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 account.2.alert_info_url_enable = 
 account.2.ringtone.ring_type = 
 
 ###Only for T46G Model
 account.2.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 account.2.conf_type = 
 account.2.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.2.cid_source = 
 account.2.cid_source_privacy = 
 account.2.cid_source_ppi = 
 account.2.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.2.session_timer.enable = 
 account.2.session_timer.expires = 
 account.2.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 account.2.music_on_hold_type = 
 account.2.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.2.auto_answer = 
 account.2.missed_calllog = 
 account.2.100rel_enable = 
 account.2.enable_user_equal_phone = 
 account.2.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##       
 #######################################################################################
 account.2.dnd.enable =
 account.2.dnd.on_code = 
 account.2.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.2.always_fwd.enable = 
 account.2.always_fwd.target = 
 account.2.always_fwd.off_code =
 account.2.always_fwd.on_code =
 account.2.busy_fwd.enable =          
 account.2.busy_fwd.target =         
 account.2.busy_fwd.off_code =
 account.2.busy_fwd.on_code =
 account.2.timeout_fwd.enable = 
 account.2.timeout_fwd.target =
 account.2.timeout_fwd.timeout =  
 account.2.timeout_fwd.off_code =
 account.2.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.2.hoteling.enable = 
 account.2.hoteling.user_id = 
 account.2.hoteling.password = 
 account.2.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.2.acd.enable = 
 account.2.acd.unavailable_reason_enable = 
 account.2.acd.available = 
 account.2.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.2.reason_code.1 =
 account.2.reason_code_name.1 = 
 account.2.bw_disp_code.1 =
 account.2.bw_disp_code_name.1 =
 account.2.supervisor_info_code.1 =
 account.2.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.2.call_center.call_info_enable = 
 account.2.call_center.show_call_info_time = 
 account.2.call_center.disp_code_enable = 
 account.2.call_center.trace_enable = 
 account.2.call_center.emergency_enable = 
 account.2.call_center.queue_status_enable = 
 account.2.call_center.queue_status_light_enable = 
 
 
 #######################################################################################
 ##                           Account3 Basic Settings                                 ##       
 #######################################################################################
 account.3.enable = 
 account.3.label = 
 account.3.display_name =
 account.3.auth_name = 
 account.3.user_name = 
 account.3.password = 
 account.3.outbound_proxy_enable = 
 account.3.outbound_host = 
 account.3.outbound_port = 
 account.3.sip_listen_port = 
 account.3.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.3.reregister_enable = 
 account.3.naptr_build = 
 account.3.fallback.redundancy_type = 
 account.3.fallback.timeout = 
 account.3.sip_server.1.address =
 account.3.sip_server.1.port = 
 account.3.sip_server.1.expires = 
 account.3.sip_server.1.retry_counts = 
 account.3.sip_server.1.failback_mode = 
 account.3.sip_server.1.failback_timeout = 
 account.3.sip_server.1.register_on_enable = 
 
 account.3.sip_server.2.address =
 account.3.sip_server.2.port = 
 account.3.sip_server.2.expires = 
 account.3.sip_server.2.retry_counts = 
 account.3.sip_server.2.failback_mode = 
 account.3.sip_server.2.failback_timeout = 
 account.3.sip_server.2.register_on_enable = 
 
 account.3.dns_cache_type = 
 account.3.dns_cache_a.1.name =
 account.3.dns_cache_a.1.ip =
 account.3.dns_cache_a.1.ttl = 
 account.3.dns_cache_srv.1.name =
 account.3.dns_cache_srv.1.port = 
 account.3.dns_cache_srv.1.priority = 
 account.3.dns_cache_srv.1.target =
 account.3.dns_cache_srv.1.weight = 
 account.3.dns_cache_srv.1.ttl = 
 account.3.dns_cache_naptr.1.name =
 account.3.dns_cache_naptr.1.flags =
 account.3.dns_cache_naptr.1.order = 
 account.3.dns_cache_naptr.1.preference = 
 account.3.dns_cache_naptr.1.replace =
 account.3.dns_cache_naptr.1.service =
 account.3.dns_cache_naptr.1.ttl = 
 
 account.3.dns_cache_type = 
 account.3.dns_cache_a.2.name =
 account.3.dns_cache_a.2.ip =
 account.3.dns_cache_a.2.ttl = 
 account.3.dns_cache_srv.2.name =
 account.3.dns_cache_srv.2.port = 
 account.3.dns_cache_srv.2.priority = 
 account.3.dns_cache_srv.2.target =
 account.3.dns_cache_srv.2.weight = 
 account.3.dns_cache_srv.2.ttl = 
 account.3.dns_cache_naptr.2.name =
 account.3.dns_cache_naptr.2.flags =
 account.3.dns_cache_naptr.2.order = 
 account.3.dns_cache_naptr.2.preference = 
 account.3.dns_cache_naptr.2.replace =
 account.3.dns_cache_naptr.2.service =
 account.3.dns_cache_naptr.2.ttl = 
 
 account.3.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 account.3.sip_server_type = 
 account.3.unregister_on_reboot = 
 account.3.sip_trust_ctrl = 
 account.3.proxy_require = 
 account.3.srv_ttl_timer_enable = 
 account.3.register_mac = 
 account.3.register_line = 
 account.3.reg_fail_retry_interval = 
 
 #########################################################################
 ##                     NAT Settings                                    ##
 #########################################################################
 account.3.nat.nat_traversal = 
 account.3.nat.stun_server = 
 account.3.nat.stun_port = 
 account.3.nat.udp_update_enable = 
 account.3.nat.udp_update_time = 
 account.3.nat.rport = 
 
 #######################################################################################
 ##                            Account3 Advance Settings                              ##       
 #######################################################################################
 account.3.advanced.timer_t1 = 
 account.3.advanced.timer_t2 = 
 account.3.advanced.timer_t4 = 
 
 voice_mail.number.3 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 account.3.subscribe_mwi = 
 account.3.subscribe_mwi_expires = 
 account.3.subscribe_mwi_to_vm = 
 account.3.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 account.3.blf.blf_list_uri = 
 account.3.blf_list_code = 
 account.3.blf_list_barge_in_code = 
 account.3.blf.subscribe_period = 
 account.3.blf.subscribe_event =
 account.3.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 account.3.shared_line = 
 account.3.bla_number = 
 account.3.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.3.codec.1.enable = 
 account.3.codec.1.payload_type = 
 account.3.codec.1.priority = 
 account.3.codec.1.rtpmap = 
 
 account.3.codec.2.enable = 
 account.3.codec.2.payload_type = 
 account.3.codec.2.priority = 
 account.3.codec.2.rtpmap = 
 
 account.3.codec.3.enable = 
 account.3.codec.3.payload_type = 
 account.3.codec.3.priority = 
 account.3.codec.3.rtpmap = 
 
 account.3.codec.4.enable = 
 account.3.codec.4.payload_type = 
 account.3.codec.4.priority = 
 account.3.codec.4.rtpmap = 
 
 account.3.codec.5.enable = 
 account.3.codec.5.payload_type = 
 account.3.codec.5.priority = 
 account.3.codec.5.rtpmap = 
 
 account.3.codec.6.enable = 
 account.3.codec.6.payload_type = 
 account.3.codec.6.priority = 
 account.3.codec.6.rtpmap = 
 
 account.3.codec.7.enable = 
 account.3.codec.7.payload_type = 
 account.3.codec.7.priority = 
 account.3.codec.7.rtpmap = 
 
 account.3.codec.8.enable = 
 account.3.codec.8.payload_type = 
 account.3.codec.8.priority = 
 account.3.codec.8.rtpmap = 
 
 account.3.codec.9.enable = 
 account.3.codec.9.payload_type = 
 account.3.codec.9.priority = 
 account.3.codec.9.rtpmap = 
 
 account.3.codec.10.enable = 
 account.3.codec.10.payload_type = 
 account.3.codec.10.priority = 
 account.3.codec.10.rtpmap = 
 
 account.3.codec.11.enable = 
 account.3.codec.11.payload_type = 
 account.3.codec.11.priority = 
 account.3.codec.11.rtpmap = 
 
 account.3.codec.12.enable = 
 account.3.codec.12.payload_type = 
 account.3.codec.12.priority = 
 account.3.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 account.3.srtp_encryption = 
 account.3.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ## 
 #######################################################################################
 account.3.send_anonymous_code = 
 account.3.anonymous_call = 
 account.3.anonymous_call_oncode = 
 account.3.anonymous_call_offcode = 
 account.3.reject_anonymous_call = 
 account.3.anonymous_reject_oncode = 
 account.3.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##
 #######################################################################################
 account.3.dialoginfo_callpickup = 
 account.3.group_pickup_code = 
 account.3.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.3.dtmf.type = 
 account.3.dtmf.info_type = 
 account.3.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 account.3.alert_info_url_enable = 
 account.3.ringtone.ring_type = 
 
 ###Only for T46G Model
 account.3.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 account.3.conf_type = 
 account.3.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.3.cid_source = 
 account.3.cid_source_privacy = 
 account.3.cid_source_ppi = 
 account.3.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.3.session_timer.enable = 
 account.3.session_timer.expires = 
 account.3.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 account.3.music_on_hold_type = 
 account.3.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.3.auto_answer = 
 account.3.missed_calllog = 
 account.3.100rel_enable = 
 account.3.enable_user_equal_phone = 
 account.3.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##       
 #######################################################################################
 account.3.dnd.enable =
 account.3.dnd.on_code = 
 account.3.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.3.always_fwd.enable = 
 account.3.always_fwd.target = 
 account.3.always_fwd.off_code =
 account.3.always_fwd.on_code =
 account.3.busy_fwd.enable =          
 account.3.busy_fwd.target =         
 account.3.busy_fwd.off_code =
 account.3.busy_fwd.on_code =
 account.3.timeout_fwd.enable = 
 account.3.timeout_fwd.target =
 account.3.timeout_fwd.timeout =  
 account.3.timeout_fwd.off_code =
 account.3.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.3.hoteling.enable = 
 account.3.hoteling.user_id = 
 account.3.hoteling.password = 
 account.3.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.3.acd.enable = 
 account.3.acd.unavailable_reason_enable = 
 account.3.acd.available = 
 account.3.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.3.reason_code.1 =
 account.3.reason_code_name.1 = 
 account.3.bw_disp_code.1 =
 account.3.bw_disp_code_name.1 =
 account.3.supervisor_info_code.1 =
 account.3.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.3.call_center.call_info_enable = 
 account.3.call_center.show_call_info_time = 
 account.3.call_center.disp_code_enable = 
 account.3.call_center.trace_enable = 
 account.3.call_center.emergency_enable = 
 account.3.call_center.queue_status_enable = 
 account.3.call_center.queue_status_light_enable = 
 
 
 #######################################################################################
 ##                           Account4 Basic Settings                                 ##       
 #######################################################################################
 account.4.enable = 
 account.4.label = 
 account.4.display_name =
 account.4.auth_name = 
 account.4.user_name = 
 account.4.password = 
 account.4.outbound_proxy_enable = 
 account.4.outbound_host = 
 account.4.outbound_port = 
 account.4.sip_listen_port = 
 account.4.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.4.reregister_enable = 
 account.4.naptr_build = 
 account.4.fallback.redundancy_type = 
 account.4.fallback.timeout = 
 account.4.sip_server.1.address =
 account.4.sip_server.1.port = 
 account.4.sip_server.1.expires = 
 account.4.sip_server.1.retry_counts = 
 account.4.sip_server.1.failback_mode = 
 account.4.sip_server.1.failback_timeout = 
 account.4.sip_server.1.register_on_enable = 
 
 account.4.sip_server.2.address =
 account.4.sip_server.2.port = 
 account.4.sip_server.2.expires = 
 account.4.sip_server.2.retry_counts = 
 account.4.sip_server.2.failback_mode = 
 account.4.sip_server.2.failback_timeout = 
 account.4.sip_server.2.register_on_enable = 
 
 account.4.dns_cache_type = 
 account.4.dns_cache_a.1.name =
 account.4.dns_cache_a.1.ip =
 account.4.dns_cache_a.1.ttl = 
 account.4.dns_cache_srv.1.name =
 account.4.dns_cache_srv.1.port = 
 account.4.dns_cache_srv.1.priority = 
 account.4.dns_cache_srv.1.target =
 account.4.dns_cache_srv.1.weight = 
 account.4.dns_cache_srv.1.ttl = 
 account.4.dns_cache_naptr.1.name =
 account.4.dns_cache_naptr.1.flags =
 account.4.dns_cache_naptr.1.order = 
 account.4.dns_cache_naptr.1.preference = 
 account.4.dns_cache_naptr.1.replace =
 account.4.dns_cache_naptr.1.service =
 account.4.dns_cache_naptr.1.ttl = 
 
 account.4.dns_cache_type = 
 account.4.dns_cache_a.2.name =
 account.4.dns_cache_a.2.ip =
 account.4.dns_cache_a.2.ttl = 
 account.4.dns_cache_srv.2.name =
 account.4.dns_cache_srv.2.port = 
 account.4.dns_cache_srv.2.priority = 
 account.4.dns_cache_srv.2.target =
 account.4.dns_cache_srv.2.weight = 
 account.4.dns_cache_srv.2.ttl = 
 account.4.dns_cache_naptr.2.name =
 account.4.dns_cache_naptr.2.flags =
 account.4.dns_cache_naptr.2.order = 
 account.4.dns_cache_naptr.2.preference = 
 account.4.dns_cache_naptr.2.replace =
 account.4.dns_cache_naptr.2.service =
 account.4.dns_cache_naptr.2.ttl = 
 
 account.4.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 account.4.sip_server_type = 
 account.4.unregister_on_reboot = 
 account.4.sip_trust_ctrl = 
 account.4.proxy_require = 
 account.4.srv_ttl_timer_enable = 
 account.4.register_mac = 
 account.4.register_line = 
 account.4.reg_fail_retry_interval = 
 
 #########################################################################
 ##                     NAT Settings                                    ##
 #########################################################################
 account.4.nat.nat_traversal = 
 account.4.nat.stun_server = 
 account.4.nat.stun_port = 
 account.4.nat.udp_update_enable = 
 account.4.nat.udp_update_time = 
 account.4.nat.rport = 
 
 #######################################################################################
 ##                            Account4 Advance Settings                              ##       
 #######################################################################################
 account.4.advanced.timer_t1 = 
 account.4.advanced.timer_t2 = 
 account.4.advanced.timer_t4 = 
 voice_mail.number.4 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 account.4.subscribe_mwi = 
 account.4.subscribe_mwi_expires = 
 account.4.subscribe_mwi_to_vm = 
 account.4.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 account.4.blf.blf_list_uri = 
 account.4.blf_list_code = 
 account.4.blf_list_barge_in_code = 
 account.4.blf.subscribe_period = 
 account.4.blf.subscribe_event =
 account.4.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 account.4.shared_line = 
 account.4.bla_number = 
 account.4.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.4.codec.1.enable = 
 account.4.codec.1.payload_type = 
 account.4.codec.1.priority = 
 account.4.codec.1.rtpmap = 
 
 account.4.codec.2.enable = 
 account.4.codec.2.payload_type = 
 account.4.codec.2.priority = 
 account.4.codec.2.rtpmap = 
 
 account.4.codec.3.enable = 
 account.4.codec.3.payload_type = 
 account.4.codec.3.priority = 
 account.4.codec.3.rtpmap = 
 
 account.4.codec.4.enable = 
 account.4.codec.4.payload_type = 
 account.4.codec.4.priority = 
 account.4.codec.4.rtpmap = 
 
 account.4.codec.5.enable = 
 account.4.codec.5.payload_type = 
 account.4.codec.5.priority = 
 account.4.codec.5.rtpmap = 
 
 account.4.codec.6.enable = 
 account.4.codec.6.payload_type = 
 account.4.codec.6.priority = 
 account.4.codec.6.rtpmap = 
 
 account.4.codec.7.enable = 
 account.4.codec.7.payload_type = 
 account.4.codec.7.priority = 
 account.4.codec.7.rtpmap = 
 
 account.4.codec.8.enable = 
 account.4.codec.8.payload_type = 
 account.4.codec.8.priority = 
 account.4.codec.8.rtpmap = 
 
 account.4.codec.9.enable = 
 account.4.codec.9.payload_type = 
 account.4.codec.9.priority = 
 account.4.codec.9.rtpmap = 
 
 account.4.codec.10.enable = 
 account.4.codec.10.payload_type = 
 account.4.codec.10.priority = 
 account.4.codec.10.rtpmap = 
 
 account.4.codec.11.enable = 
 account.4.codec.11.payload_type = 
 account.4.codec.11.priority = 
 account.4.codec.11.rtpmap = 
 
 account.4.codec.12.enable = 
 account.4.codec.12.payload_type = 
 account.4.codec.12.priority = 
 account.4.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 account.4.srtp_encryption = 
 account.4.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ##       
 #######################################################################################
 account.4.send_anonymous_code = 
 account.4.anonymous_call = 
 account.4.anonymous_call_oncode = 
 account.4.anonymous_call_offcode = 
 account.4.reject_anonymous_call = 
 account.4.anonymous_reject_oncode = 
 account.4.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##       
 #######################################################################################
 account.4.dialoginfo_callpickup = 
 account.4.group_pickup_code = 
 account.4.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.4.dtmf.type = 
 account.4.dtmf.info_type = 
 account.4.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 account.4.alert_info_url_enable = 
 account.4.ringtone.ring_type = 
 
 ###Only for T46G Model
 account.4.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 account.4.conf_type = 
 account.4.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.4.cid_source = 
 account.4.cid_source_privacy = 
 account.4.cid_source_ppi = 
 account.4.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.4.session_timer.enable = 
 account.4.session_timer.expires = 
 account.4.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 account.4.music_on_hold_type = 
 account.4.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.4.auto_answer = 
 account.4.missed_calllog = 
 account.4.100rel_enable = 
 account.4.enable_user_equal_phone = 
 account.4.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##       
 #######################################################################################
 account.4.dnd.enable =
 account.4.dnd.on_code = 
 account.4.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.4.always_fwd.enable = 
 account.4.always_fwd.target = 
 account.4.always_fwd.off_code =
 account.4.always_fwd.on_code =
 account.4.busy_fwd.enable =          
 account.4.busy_fwd.target =         
 account.4.busy_fwd.off_code =
 account.4.busy_fwd.on_code =
 account.4.timeout_fwd.enable = 
 account.4.timeout_fwd.target =
 account.4.timeout_fwd.timeout =  
 account.4.timeout_fwd.off_code =
 account.4.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.4.hoteling.enable = 
 account.4.hoteling.user_id = 
 account.4.hoteling.password = 
 account.4.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.4.acd.enable = 
 account.4.acd.unavailable_reason_enable = 
 account.4.acd.available = 
 account.4.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.4.reason_code.1 =
 account.4.reason_code_name.1 = 
 account.4.bw_disp_code.1 =
 account.4.bw_disp_code_name.1 =
 account.4.supervisor_info_code.1 =
 account.4.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.4.call_center.call_info_enable = 
 account.4.call_center.show_call_info_time = 
 account.4.call_center.disp_code_enable = 
 account.4.call_center.trace_enable = 
 account.4.call_center.emergency_enable = 
 account.4.call_center.queue_status_enable = 
 account.4.call_center.queue_status_light_enable = 
 
 #######################################################################################
 ##                           Account5 Basic Settings                                 ##       
 #######################################################################################
 account.5.enable = 
 account.5.label = 
 account.5.display_name =
 account.5.auth_name = 
 account.5.user_name = 
 account.5.password = 
 account.5.outbound_proxy_enable = 
 account.5.outbound_host = 
 account.5.outbound_port = 
 account.5.sip_listen_port = 
 account.5.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.5.reregister_enable = 
 account.5.naptr_build = 
 account.5.fallback.redundancy_type = 
 account.5.fallback.timeout = 
 account.5.sip_server.1.address =
 account.5.sip_server.1.port = 
 account.5.sip_server.1.expires = 
 account.5.sip_server.1.retry_counts = 
 account.5.sip_server.1.failback_mode = 
 account.5.sip_server.1.failback_timeout = 
 account.5.sip_server.1.register_on_enable = 
 
 account.5.sip_server.2.address =
 account.5.sip_server.2.port = 
 account.5.sip_server.2.expires = 
 account.5.sip_server.2.retry_counts = 
 account.5.sip_server.2.failback_mode = 
 account.5.sip_server.2.failback_timeout = 
 account.5.sip_server.2.register_on_enable = 
 
 account.5.dns_cache_type = 
 account.5.dns_cache_a.1.name =
 account.5.dns_cache_a.1.ip =
 account.5.dns_cache_a.1.ttl = 
 account.5.dns_cache_srv.1.name =
 account.5.dns_cache_srv.1.port = 
 account.5.dns_cache_srv.1.priority = 
 account.5.dns_cache_srv.1.target =
 account.5.dns_cache_srv.1.weight = 
 account.5.dns_cache_srv.1.ttl = 
 account.5.dns_cache_naptr.1.name =
 account.5.dns_cache_naptr.1.flags =
 account.5.dns_cache_naptr.1.order = 
 account.5.dns_cache_naptr.1.preference = 
 account.5.dns_cache_naptr.1.replace =
 account.5.dns_cache_naptr.1.service =
 account.5.dns_cache_naptr.1.ttl = 
 
 account.5.dns_cache_type = 
 account.5.dns_cache_a.2.name =
 account.5.dns_cache_a.2.ip =
 account.5.dns_cache_a.2.ttl = 
 account.5.dns_cache_srv.2.name =
 account.5.dns_cache_srv.2.port = 
 account.5.dns_cache_srv.2.priority = 
 account.5.dns_cache_srv.2.target =
 account.5.dns_cache_srv.2.weight = 
 account.5.dns_cache_srv.2.ttl = 
 account.5.dns_cache_naptr.2.name =
 account.5.dns_cache_naptr.2.flags =
 account.5.dns_cache_naptr.2.order = 
 account.5.dns_cache_naptr.2.preference = 
 account.5.dns_cache_naptr.2.replace =
 account.5.dns_cache_naptr.2.service =
 account.5.dns_cache_naptr.2.ttl = 
 
 account.5.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 account.5.sip_server_type = 
 account.5.unregister_on_reboot = 
 account.5.sip_trust_ctrl = 
 account.5.proxy_require = 
 account.5.srv_ttl_timer_enable = 
 account.5.register_mac = 
 account.5.register_line = 
 account.5.reg_fail_retry_interval = 
 
 #########################################################################
 ##                     NAT Settings                                    ##
 #########################################################################
 account.5.nat.nat_traversal = 
 account.5.nat.stun_server = 
 account.5.nat.stun_port = 
 account.5.nat.udp_update_enable = 
 account.5.nat.udp_update_time = 
 account.5.nat.rport = 
 
 #######################################################################################
 ##                            Account5 Advance Settings                              ##       
 #######################################################################################
 account.5.advanced.timer_t1 = 
 account.5.advanced.timer_t2 = 
 account.5.advanced.timer_t4 = 
 
 voice_mail.number.5 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 account.5.subscribe_mwi = 
 account.5.subscribe_mwi_expires = 
 account.5.subscribe_mwi_to_vm = 
 account.5.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 
 account.5.blf.blf_list_uri = 
 account.5.blf_list_code = 
 account.5.blf_list_barge_in_code = 
 account.5.blf.subscribe_period = 
 account.5.blf.subscribe_event =
 account.5.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 account.5.shared_line = 
 account.5.bla_number = 
 account.5.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.5.codec.1.enable = 
 account.5.codec.1.payload_type = 
 account.5.codec.1.priority = 
 account.5.codec.1.rtpmap = 
 
 account.5.codec.2.enable = 
 account.5.codec.2.payload_type = 
 account.5.codec.2.priority = 
 account.5.codec.2.rtpmap = 
 
 account.5.codec.3.enable = 
 account.5.codec.3.payload_type = 
 account.5.codec.3.priority = 
 account.5.codec.3.rtpmap = 
 
 account.5.codec.4.enable = 
 account.5.codec.4.payload_type = 
 account.5.codec.4.priority = 
 account.5.codec.4.rtpmap = 
 
 account.5.codec.5.enable = 
 account.5.codec.5.payload_type = 
 account.5.codec.5.priority = 
 account.5.codec.5.rtpmap = 
 
 account.5.codec.6.enable = 
 account.5.codec.6.payload_type = 
 account.5.codec.6.priority = 
 account.5.codec.6.rtpmap = 
 
 account.5.codec.7.enable = 
 account.5.codec.7.payload_type = 
 account.5.codec.7.priority = 
 account.5.codec.7.rtpmap = 
 
 account.5.codec.8.enable = 
 account.5.codec.8.payload_type = 
 account.5.codec.8.priority = 
 account.5.codec.8.rtpmap = 
 
 account.5.codec.9.enable = 
 account.5.codec.9.payload_type = 
 account.5.codec.9.priority = 
 account.5.codec.9.rtpmap = 
 
 account.5.codec.10.enable = 
 account.5.codec.10.payload_type = 
 account.5.codec.10.priority = 
 account.5.codec.10.rtpmap = 
 
 account.5.codec.11.enable = 
 account.5.codec.11.payload_type = 
 account.5.codec.11.priority = 
 account.5.codec.11.rtpmap = 
 
 account.5.codec.12.enable = 
 account.5.codec.12.payload_type = 
 account.5.codec.12.priority = 
 account.5.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 account.5.srtp_encryption = 
 account.5.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ##       
 #######################################################################################
 account.5.send_anonymous_code = 
 account.5.anonymous_call = 
 account.5.anonymous_call_oncode = 
 account.5.anonymous_call_offcode = 
 account.5.reject_anonymous_call = 
 account.5.anonymous_reject_oncode = 
 account.5.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##       
 #######################################################################################
 account.5.dialoginfo_callpickup = 
 account.5.group_pickup_code = 
 account.5.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.5.dtmf.type = 
 account.5.dtmf.info_type = 
 account.5.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 account.5.alert_info_url_enable = 
 account.5.ringtone.ring_type = 
 
 ###Only for T46G Model
 account.5.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 account.5.conf_type = 
 account.5.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.5.cid_source = 
 account.5.cid_source_privacy = 
 account.5.cid_source_ppi = 
 account.5.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.5.session_timer.enable = 
 account.5.session_timer.expires = 
 account.5.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 account.5.music_on_hold_type = 
 account.5.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.5.auto_answer = 
 account.5.missed_calllog = 
 account.5.100rel_enable = 
 account.5.enable_user_equal_phone = 
 account.5.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##      
 #######################################################################################
 account.5.dnd.enable =
 account.5.dnd.on_code = 
 account.5.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.5.always_fwd.enable = 
 account.5.always_fwd.target = 
 account.5.always_fwd.off_code =
 account.5.always_fwd.on_code =
 account.5.busy_fwd.enable =          
 account.5.busy_fwd.target =         
 account.5.busy_fwd.off_code =
 account.5.busy_fwd.on_code =
 account.5.timeout_fwd.enable = 
 account.5.timeout_fwd.target =
 account.5.timeout_fwd.timeout =  
 account.5.timeout_fwd.off_code =
 account.5.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.5.hoteling.enable = 
 account.5.hoteling.user_id = 
 account.5.hoteling.password = 
 account.5.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.5.acd.enable = 
 account.5.acd.unavailable_reason_enable = 
 account.5.acd.available = 
 account.5.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.5.reason_code.1 =
 account.5.reason_code_name.1 = 
 account.5.bw_disp_code.1 =
 account.5.bw_disp_code_name.1 =
 account.5.supervisor_info_code.1 =
 account.5.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.5.call_center.call_info_enable = 
 account.5.call_center.show_call_info_time = 
 account.5.call_center.disp_code_enable = 
 account.5.call_center.trace_enable = 
 account.5.call_center.emergency_enable = 
 account.5.call_center.queue_status_enable = 
 account.5.call_center.queue_status_light_enable = 
 
 #######################################################################################
 ##                           Account6 Basic Settings                                 ##       
 #######################################################################################
 account.6.enable = 
 account.6.label = 
 account.6.display_name =
 account.6.auth_name = 
 account.6.user_name = 
 account.6.password = 
 account.6.outbound_proxy_enable = 
 account.6.outbound_host = 
 account.6.outbound_port = 
 account.6.sip_listen_port = 
 account.6.transport = 
 
 #######################################################################################
 ##                          Failback                                                 ##       
 #######################################################################################
 account.6.reregister_enable = 
 account.6.naptr_build = 
 account.6.fallback.redundancy_type = 
 account.6.fallback.timeout = 
 account.6.sip_server.1.address =
 account.6.sip_server.1.port = 
 account.6.sip_server.1.expires = 
 account.6.sip_server.1.retry_counts = 
 account.6.sip_server.1.failback_mode = 
 account.6.sip_server.1.failback_timeout = 
 account.6.sip_server.1.register_on_enable = 
 
 account.6.sip_server.2.address =
 account.6.sip_server.2.port = 
 account.6.sip_server.2.expires = 
 account.6.sip_server.2.retry_counts = 
 account.6.sip_server.2.failback_mode = 
 account.6.sip_server.2.failback_timeout = 
 account.6.sip_server.2.register_on_enable = 
 
 account.6.dns_cache_type = 
 account.6.dns_cache_a.1.name =
 account.6.dns_cache_a.1.ip =
 account.6.dns_cache_a.1.ttl = 
 account.6.dns_cache_srv.1.name =
 account.6.dns_cache_srv.1.port = 
 account.6.dns_cache_srv.1.priority = 
 account.6.dns_cache_srv.1.target =
 account.6.dns_cache_srv.1.weight = 
 account.6.dns_cache_srv.1.ttl = 
 account.6.dns_cache_naptr.1.name =
 account.6.dns_cache_naptr.1.flags =
 account.6.dns_cache_naptr.1.order = 
 account.6.dns_cache_naptr.1.preference = 
 account.6.dns_cache_naptr.1.replace =
 account.6.dns_cache_naptr.1.service =
 account.6.dns_cache_naptr.1.ttl = 
 
 account.6.dns_cache_type = 
 account.6.dns_cache_a.2.name =
 account.6.dns_cache_a.2.ip =
 account.6.dns_cache_a.2.ttl = 
 account.6.dns_cache_srv.2.name =
 account.6.dns_cache_srv.2.port = 
 account.6.dns_cache_srv.2.priority = 
 account.6.dns_cache_srv.2.target =
 account.6.dns_cache_srv.2.weight = 
 account.6.dns_cache_srv.2.ttl = 
 account.6.dns_cache_naptr.2.name =
 account.6.dns_cache_naptr.2.flags =
 account.6.dns_cache_naptr.2.order = 
 account.6.dns_cache_naptr.2.preference = 
 account.6.dns_cache_naptr.2.replace =
 account.6.dns_cache_naptr.2.service =
 account.6.dns_cache_naptr.2.ttl = 
 
 account.6.static_cache_pri = 
 
 #######################################################################################
 ##                           Register Advanced                                       ##       
 #######################################################################################
 account.6.sip_server_type = 
 account.6.unregister_on_reboot = 
 account.6.sip_trust_ctrl = 
 account.6.proxy_require = 
 account.6.srv_ttl_timer_enable = 
 account.6.register_mac = 
 account.6.register_line = 
 account.6.reg_fail_retry_interval = 
 
 #########################################################################
 ##                     NAT Settings                                    ##
 #########################################################################
 account.6.nat.nat_traversal = 
 account.6.nat.stun_server = 
 account.6.nat.stun_port = 
 account.6.nat.udp_update_enable = 
 account.6.nat.udp_update_time = 
 account.6.nat.rport = 
 
 #######################################################################################
 ##                            Account6 Advance Settings                              ##       
 #######################################################################################
 account.6.advanced.timer_t1 = 
 account.6.advanced.timer_t2 = 
 account.6.advanced.timer_t4 = 
 
 voice_mail.number.6 = 
 
 #######################################################################################
 ##                            Subscribe                                              ##       
 #######################################################################################
 account.6.subscribe_mwi = 
 account.6.subscribe_mwi_expires = 
 account.6.subscribe_mwi_to_vm = 
 account.6.subscribe_acd_expires= 
 
 #######################################################################################
 ##                            BLF List(Except T19D Model)                            ##       
 #######################################################################################
 
 account.6.blf.blf_list_uri = 
 account.6.blf_list_code = 
 account.6.blf_list_barge_in_code = 
 account.6.blf.subscribe_period = 
 account.6.blf.subscribe_event =
 account.6.out_dialog_blf_enable = 
 
 #######################################################################################
 ##                            BLA/SCA                                                ##       
 #######################################################################################
 account.6.shared_line = 
 account.6.bla_number = 
 account.6.bla_subscribe_period = 
 
 #######################################################################################
 ##                            Audio Codec                                            ##       
 #######################################################################################
 ###T19D/T21D support codec1~codec8
 ###T20P/T22P/T26P/T28P support codec1~codec11
 ###T41P/T42G/T46G support codec1~codec12
 
 account.6.codec.1.enable = 
 account.6.codec.1.payload_type = 
 account.6.codec.1.priority = 
 account.6.codec.1.rtpmap = 
 
 account.6.codec.2.enable = 
 account.6.codec.2.payload_type = 
 account.6.codec.2.priority = 
 account.6.codec.2.rtpmap = 
 
 account.6.codec.3.enable = 
 account.6.codec.3.payload_type = 
 account.6.codec.3.priority = 
 account.6.codec.3.rtpmap = 
 
 account.6.codec.4.enable = 
 account.6.codec.4.payload_type = 
 account.6.codec.4.priority = 
 account.6.codec.4.rtpmap = 
 
 account.6.codec.5.enable = 
 account.6.codec.5.payload_type = 
 account.6.codec.5.priority = 
 account.6.codec.5.rtpmap = 
 
 account.6.codec.6.enable = 
 account.6.codec.6.payload_type = 
 account.6.codec.6.priority = 
 account.6.codec.6.rtpmap = 
 
 account.6.codec.7.enable = 
 account.6.codec.7.payload_type = 
 account.6.codec.7.priority = 
 account.6.codec.7.rtpmap = 
 
 account.6.codec.8.enable = 
 account.6.codec.8.payload_type = 
 account.6.codec.8.priority = 
 account.6.codec.8.rtpmap = 
 
 account.6.codec.9.enable = 
 account.6.codec.9.payload_type = 
 account.6.codec.9.priority = 
 account.6.codec.9.rtpmap = 
 
 account.6.codec.10.enable = 
 account.6.codec.10.payload_type = 
 account.6.codec.10.priority = 
 account.6.codec.10.rtpmap = 
 
 account.6.codec.11.enable = 
 account.6.codec.11.payload_type = 
 account.6.codec.11.priority = 
 account.6.codec.11.rtpmap = 
 
 account.6.codec.12.enable = 
 account.6.codec.12.payload_type = 
 account.6.codec.12.priority = 
 account.6.codec.12.rtpmap = 
 
 #######################################################################################
 ##                            Audio Advanced                                         ##       
 #######################################################################################
 account.6.srtp_encryption = 
 account.6.ptime = 
 
 #######################################################################################
 ##                            Anonymous Call                                         ##       
 #######################################################################################
 account.6.send_anonymous_code = 
 account.6.anonymous_call = 
 account.6.anonymous_call_oncode = 
 account.6.anonymous_call_offcode = 
 account.6.reject_anonymous_call = 
 account.6.anonymous_reject_oncode = 
 account.6.anonymous_reject_offcode = 
 
 #######################################################################################
 ##                            Pickup Code                                            ##       
 #######################################################################################
 account.6.dialoginfo_callpickup = 
 account.6.group_pickup_code = 
 account.6.direct_pickup_code = 
 
 #######################################################################################
 ##                            DTMF                                                   ##       
 #######################################################################################
 account.6.dtmf.type = 
 account.6.dtmf.info_type = 
 
 ###Only T46G Model supports this parameter
 account.6.dtmf.dtmf_payload = 
 
 #######################################################################################
 ##                            Alert info                                             ##       
 #######################################################################################
 account.6.alert_info_url_enable = 
 account.6.ringtone.ring_type = 
 
 ###Only for T46G Model
 account.6.picture_info_enable = 
 
 #######################################################################################
 ##                            Conference                                             ##       
 #######################################################################################
 account.6.conf_type = 
 account.6.conf_uri = 
 
 #######################################################################################
 ##                            CID Source                                             ##       
 #######################################################################################
 account.6.cid_source = 
 account.6.cid_source_privacy = 
 account.6.cid_source_ppi = 
 account.6.cp_source = 
 
 #######################################################################################
 ##                            Session Timer                                          ##       
 #######################################################################################
 account.6.session_timer.enable = 
 account.6.session_timer.expires = 
 account.6.session_timer.refresher = 
 
 #######################################################################################
 ##                            Music on Hold                                          ##       
 #######################################################################################
 account.6.music_on_hold_type = 
 account.6.music_server_uri = 
 
 #######################################################################################
 ##                            Advanced                                               ##       
 #######################################################################################
 account.6.auto_answer = 
 account.6.missed_calllog = 
 account.6.100rel_enable = 
 account.6.enable_user_equal_phone = 
 account.6.compact_header_enable = 
 
 #######################################################################################
 ##                                   DND(Except T19 Model)                           ##       
 #######################################################################################
 account.6.dnd.enable =
 account.6.dnd.on_code = 
 account.6.dnd.off_code =
 
 #######################################################################################
 ##                                 Call Forward(Except T19 Model)                    ##       
 #######################################################################################
 account.6.always_fwd.enable = 
 account.6.always_fwd.target = 
 account.6.always_fwd.off_code =
 account.6.always_fwd.on_code =
 account.6.busy_fwd.enable =          
 account.6.busy_fwd.target =         
 account.6.busy_fwd.off_code =
 account.6.busy_fwd.on_code =
 account.6.timeout_fwd.enable = 
 account.6.timeout_fwd.target =
 account.6.timeout_fwd.timeout =  
 account.6.timeout_fwd.off_code =
 account.6.timeout_fwd.on_code = 
 
 #######################################################################################
 ##                                 Broadsoft Hoteling                                ##       
 #######################################################################################
 account.6.hoteling.enable = 
 account.6.hoteling.user_id = 
 account.6.hoteling.password = 
 account.6.hoteling.auto_login_enable = 
 
 #######################################################################################
 ##                                 Broadsoft ACD                                     ##       
 #######################################################################################
 account.6.acd.enable = 
 account.6.acd.unavailable_reason_enable = 
 account.6.acd.available = 
 account.6.acd.initial_state = 
 
 #######################################################################################
 ##                                 Broadsoft ACD Call Center                         ##       
 #######################################################################################
 account.6.reason_code.1 =
 account.6.reason_code_name.1 = 
 account.6.bw_disp_code.1 =
 account.6.bw_disp_code_name.1 =
 account.6.supervisor_info_code.1 =
 account.6.supervisor_info_code_name.1 =
 
 #######################################################################################
 ##                                 Broadsoft Call Center                             ##       
 #######################################################################################
 account.6.call_center.call_info_enable = 
 account.6.call_center.show_call_info_time = 
 account.6.call_center.disp_code_enable = 
 account.6.call_center.trace_enable = 
 account.6.call_center.emergency_enable = 
 account.6.call_center.queue_status_enable = 
 account.6.call_center.queue_status_light_enable = 
 
 
 #######################################################################################
 ##                                 Broadsoft Setting                                ##        
 #######################################################################################
 bw.enable =
 
 ###It enables or disables feature key synchronization.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 bw.feature_key_sync = 
 
 #######################################################################################
 ##         Broadsoft XSI (Only account1 supports these settings)                      ##      
 #######################################################################################
 ##It configures the user name for XSI authentication for account X.Example:account.1.xsi.user = 3502@as.iop1.broadworks.net.
 ##The default value is blank.
 account.1.xsi.user =  
 
 ##It configures the password for XSI authentication for account X.Example:account.1.xsi.password = 123456.
 ##The default value is blank.
 account.1.xsi.password = 
 
 ##It configures the access URL of the Xtended Services Platform server for account X.Example:account.1.xsi.host = xsp1.iop1.broadworks.net.
 ##The default value is blank.
 account.1.xsi.host = 
 
 ##It configures the server type of the Xtended Services Platform server for account X.Example:account.1.xsi.server_type = http.
 ##The default value is http.
 account.1.xsi.server_type = 
 
 ##It configures the server port of the Xtended Services Platform server for account X.Example:account.1.xsi.port = 80.
 ##The default value is 80.Integer from 1 to 65535
 account.1.xsi.port = 
 
 ##It configures the interval (in minutes) for the phone to update the data of the BroadSoft directory from the BroadSoft server.
 ##The default value is 60.Integer from 2 to 43200
 directory.update_time_interval = 
 
 #######################################################################################
 ##                                   Broadsoft Phonebook(Except T20P model)          ##       
 #######################################################################################
 ###It enables or disables the phone to display the group directory.
 ###0-Disabled,1-Enabled.
 ###The default value is 1.
 bw_phonebook.group_enable = 
 
 ###It enables or disables the phone to display the personal directory.
 ###0-Disabled,1-Enabled.
 ###The default value is 1.
 bw_phonebook.personal_enable = 
 
 ###It enables or disables the phone to display the group common directory.
 ###0-Disabled,1-Enabled.
 ###The default value is 1.
 bw_phonebook.group_common_enable = 
 
 ###It configures the display name on the LCD screen for the group common directory.
 ###The default value is GroupCommon.
 bw_phonebook.group_common_displayname =
 
 ###It enables or disables the phone to display the enterprise directory.
 ###0-Disabled,1-Enabled.
 ###The default value is 1.
 bw_phonebook.enterprise_enable = 
 
 ###It enables or disables the phone to display the enterprise common directory.
 ###0-Disabled,1-Enabled.
 ###The default value is 1.
 bw_phonebook.enterprise_common_enable = 
 
 ###It configures the display name on the LCD screen for the enterprise common directory.
 ###The default value is EnterpriseCommon.
 bw_phonebook.enterprise_common_displayname =
 
 ###It enables or disables BroadSoft call log feature.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 bw_phonebook.call_log_enable = 
 
 ###It enables or disables custom directory feature.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 bw_phonebook.custom =
 
 ###It configures the display name on the LCD screen for the group directory.
 ###The default value is Group.
 bw_phonebook.group_displayname =
 
 ###It configures the display name on the LCD screen for the enterprise directory.
 ###The default value is Enterprise.
 bw_phonebook.enterprise_displayname =
 
 ###It configures the display name on the LCD screen for the personal directory.
 ###The default value is Personal.
 bw_phonebook.personal_displayname =
 
 #######################################################################################
 ##                                   Features Pickup(Except T20P model)              ##       
 #######################################################################################
 ##It enables or disables the phone to display the GPickup soft key when the phone is in the pre-dialing screen.
 ##0-Disabled,1-Enabled.
 ##The default value is 0.
 features.pickup.group_pickup_enable = 
 
 ##It configures the group call pickup code.
 ##The default value is blank.
 features.pickup.group_pickup_code = 
 
 ##It enables or disables the phone to display the DPickup soft key when the phone is in the pre-dialing screen.
 ##0-Disabled,1-Enabled.
 ##The default value is 0.
 features.pickup.direct_pickup_enable = 
 
 ##It configures the directed call pickup code.
 ##The default value is blank.
 features.pickup.direct_pickup_code =
 
 ##It enables or disables the phone to display a visual alert when the monitored user receives an incoming call.
 ##0-Disabled,1-Enabled.
 ##The default value is 0.
 features.pickup.blf_visual_enable =
 
 ##It enables or disables the phone to play an audio alert when the monitored user receives an incoming call.
 ##0-Disabled,1-Enabled.
 ##The default value is 0.
 features.pickup.blf_audio_enable = 
 
 #######################################################################################
 ##                                   Call Park(Except T20P model)                    ##       
 #######################################################################################
 ###It enables or disables the phone to display the Park soft key during a call.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 call_park.enable = 
 
 ###It enables or disables the phone to display the GPark soft key during a call.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 call_park.group_enable = 
 
 ###It enables or disables the phone to play a warning tone when a call is parked against its line.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 call_park.park_ring =
 
 ###It enables or disables the phone to display a parked indicator when a call is parked against its line.
 ###0-Disabled,1-Enabled.
 ###The default value is 0.
 call_park.park_visual_notify_enable =
 
 #######################################################################################
 ##                                 Time                                              ##       
 #######################################################################################
 ##It configures the time zone.For more available time zones, refer to Time Zones on page 215.
 ##The default value is +8.
 local_time.time_zone = 
 
 ##It configures the time zone name.For more available time zone names, refer to Time Zones on page 215.
 ##The default time zone name is China(Beijing).
 local_time.time_zone_name = 
 
 local_time.ntp_server1 = 
 local_time.ntp_server2 = 
 
 ##It configures the update interval (in seconds) when using the NTP server.
 ##The default value is 1000.Integer from 15 to 86400
 local_time.interval = 
 
 ##It enables or disables daylight saving time (DST) feature.
 ##0-Disabled,1-Enabled,2-Automatic.
 ##The default value is 2.
 local_time.summer_time = 
 
 ##It configures the way DST works when DST feature is enabled.
 ##0-DST By Date ,1-DST By Week.
 ##The default value is 0.
 local_time.dst_time_type = 
 
 ##It configures the start time of the DST.
 ##Value formats are:Month/Day/Hour (for By Date),Month/ Day of Week/ Day of Week Last in Month/ Hour of Day (for By Week)
 ##The default value is 1/1/0.
 local_time.start_time = 
 
 ##It configures the end time of the DST.
 ##Value formats are:Month/Day/Hour (for By Date),Month/ Day of Week/ Day of Week Last in Month/ Hour of Day (for By Week)
 ##The default value is 12/31/23.
 local_time.end_time = 
 
 ##It configures the offset time (in minutes).
 ##The default value is blank.Integer from -300 to 300
 local_time.offset_time = 
 
 ##It configures the time format.0-12 Hour,1-24 Hour.
 ##The default value is 1.
 local_time.time_format = 
 
 
 local_time.date_format = 
 
 ##It enables or disables the phone to update time with the offset time obtained from the DHCP server.
 ##It is only available to offset from GMT 0.0-Disabled,1-Enabled.
 ##The default value is 0.
 local_time.dhcp_time = 
 
 ##It configures the phone to obtain time from NTP server or manual settings.0-Manual,1-NTP
 ##The default value is 1.
 local_time.manual_time_enable = 
 
 ##It enables or disables the phone to use manually configured NTP server preferentially.
 ##0-Disabled (use the NTP server obtained by DHCP preferentially),1-Enabled.
 ##The default value is 0.
 local_time.manual_ntp_srv_prior =
 
 auto_dst.url =
 
 #######################################################################################
 ##                                   NETWORK                                         ##       
 #######################################################################################
 ##It configures the IP address mode.0-IPv4,1-IPv6,2-IPv4&IPv6
 ##The default value is 0.It takes effect after a reboot.
 network.ip_address_mode = 
 
 network.ipv6_prefix = 
 network.ipv6_internet_port.type = 
 network.ipv6_internet_port.ip = 
 network.ipv6_internet_port.gateway = 
 network.ipv6_primary_dns = 
 network.ipv6_secondary_dns = 
 
 ####Only T46G Model supports this parameter
 network.ipv6_icmp_v6.enable = 
 
 network.internet_port.type = 
 network.internet_port.ip =
 network.internet_port.mask = 
 network.internet_port.gateway =
 network.primary_dns= 
 network.secondary_dns = 
 
 "
};
