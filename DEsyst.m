function [dy] = DEsyst (time,state)
% Below all conservation equation are calculated. 
% Note that "getRef" is the function that contains the input stimulus of 
% the model. 

dy = zeros(size(state));
all_constants(); % All constants used in this model
all_indices() ; % All indices used in this model

% All additional equation are calculated using the state variables. They are stored in three matrices; AC, SMC and EC
% Note that EC is empty at the moment.

[NE,AC,SMC,EC] = all_fluxes(time,state); 

% Neuron.0.0

% change in membrane potential
dy(ind.N_sa_Em)  = 1/Cm .*((-NE(flu.N_sa_tot)+ 1./(2*Ra*dhod.^2)*(state(ind.N_d_Em)-state(ind.N_sa_Em)))+0.014*rectpuls(time-50,10));%+0.0054*rectpuls(time-202,1)+0.0060*rectpuls(time-207,6));%+0.0062*rectpuls(time-206,1)+0.0065*rectpuls(time-208,1));
dy(ind.N_d_Em)   = 1/Cm .*((-NE(flu.N_d_tot))+ 1./(2*Ra*dhod.^2)*(state(ind.N_sa_Em)-state(ind.N_d_Em)));

% Change in gating variables m and h of different channels in the soma 
dy(ind.N_sa_Na_NaP_m1_GHK)= 1000.*((NE(flu.N_sa_Na_NaP_m1a1_GHK).*(1-state(ind.N_sa_Na_NaP_m1_GHK)))- (NE(flu.N_sa_Na_NaP_m1b1_GHK)*state(ind.N_sa_Na_NaP_m1_GHK)));
dy(ind.N_sa_Na_NaP_h1_GHK)= 1000.*((NE(flu.N_sa_Na_NaP_h1a1_GHK).*(1-state(ind.N_sa_Na_NaP_h1_GHK)))- (NE(flu.N_sa_Na_NaP_h1b1_GHK)*state(ind.N_sa_Na_NaP_h1_GHK)));

dy(ind.N_sa_K_KDR_m2_GHK) = 1000.*((NE(flu.N_sa_K_KDR_m2a2_GHK).*(1-state(ind.N_sa_K_KDR_m2_GHK)))- (NE(flu.N_sa_K_KDR_m2b2_GHK)*state(ind.N_sa_K_KDR_m2_GHK)));

dy(ind.N_sa_K_KA_m3_GHK)   = 1000.*((NE(flu.N_sa_K_KA_m3a3_GHK).*(1-state(ind.N_sa_K_KA_m3_GHK)))- (NE(flu.N_sa_K_KA_m3b3_GHK).*state(ind.N_sa_K_KA_m3_GHK)));
dy(ind.N_sa_K_KA_h2_GHK)  = 1000.*((NE(flu.N_sa_K_KA_h2a2_GHK).*(1-state(ind.N_sa_K_KA_h2_GHK)))- (NE(flu.N_sa_K_KA_h2b2_GHK).*state(ind.N_sa_K_KA_h2_GHK)));

% Change in gating variables m and h for different channels in the dendrite
dy(ind.N_d_Na_NaP_m4_GHK) = 1000.*((NE(flu.N_d_Na_NaP_m4a4_GHK).*(1-state(ind.N_d_Na_NaP_m4_GHK)))- (NE(flu.N_d_Na_NaP_m4b4_GHK).*state(ind.N_d_Na_NaP_m4_GHK)));
dy(ind.N_d_Na_NaP_h3_GHK) = 1000.*((NE(flu.N_d_Na_NaP_h3a3_GHK).*(1-state(ind.N_d_Na_NaP_h3_GHK)))- (NE(flu.N_d_Na_NaP_h3b3_GHK).*state(ind.N_d_Na_NaP_h3_GHK)));

dy(ind.N_d_Na_NMDA_m5_GHK)= 1000.*((NE(flu.N_d_Na_NMDA_m5a5_GHK).*(1-state(ind.N_d_Na_NMDA_m5_GHK)))- (NE(flu.N_d_Na_NMDA_m5b5_GHK).*state(ind.N_d_Na_NMDA_m5_GHK)));
dy(ind.N_d_Na_NMDA_h4_GHK)= 1000.*((NE(flu.N_d_Na_NMDA_h4a4_GHK).*(1-state(ind.N_d_Na_NMDA_h4_GHK)))- (NE(flu.N_d_Na_NMDA_h4b4_GHK).*state(ind.N_d_Na_NMDA_h4_GHK)));

dy(ind.N_d_K_KDR_m6_GHK)  = 1000.*((NE(flu.N_d_K_KDR_m6a6_GHK).*(1-state(ind.N_d_K_KDR_m6_GHK)))- (NE(flu.N_d_K_KDR_m6b6_GHK).*state(ind.N_d_K_KDR_m6_GHK)));

dy(ind.N_d_K_KA_m7_GHK)   = 1000.*((NE(flu.N_d_K_KA_m7a7_GHK).*(1-state(ind.N_d_K_KA_m7_GHK)))- (NE(flu.N_d_K_KA_m7b7_GHK).*state(ind.N_d_K_KA_m7_GHK)));
dy(ind.N_d_K_KA_h5_GHK)  = 1000.*((NE(flu.N_d_K_KA_h5a5_GHK).*(1-state(ind.N_d_K_KA_h5_GHK)))- (NE(flu.N_d_K_KA_h5b5_GHK).*state(ind.N_d_K_KA_h5_GHK)));

dy(ind.N_sa_Na_NaT_m8_GHK) = 1000.*((NE(flu.N_sa_Na_NaT_m8a8_GHK).*(1-state(ind.N_sa_Na_NaT_m8_GHK)))- (NE(flu.N_sa_Na_NaT_m8b8_GHK).*state(ind.N_sa_Na_NaT_m8_GHK)));
dy(ind.N_sa_Na_NaT_h6_GHK) = 1000.*((NE(flu.N_sa_Na_NaT_h6a6_GHK).*(1-state(ind.N_sa_Na_NaT_h6_GHK)))- (NE(flu.N_sa_Na_NaT_h6b6_GHK).*state(ind.N_sa_Na_NaT_h6_GHK)));

%change in concentration of Na,K,Cl in the soma
dy(ind.N_sa_Na)  = (-As./(F.*Vs).*(NE(flu.N_sa_Na_tot))+ D_Na.*(Vd+Vs)./(2.*dhod.^2.*Vs).*(state(ind.N_d_Na)-state(ind.N_sa_Na)));
dy(ind.N_sa_K)   = (-As./(F.*Vs).*(NE(flu.N_sa_K_tot)) + D_K.*(Vd+Vs)./(2.*dhod.^2.*Vs).*(state(ind.N_d_K)-state(ind.N_sa_K)));
dy(ind.N_sa_Cl)  = (-As./(F.*Vs).*(NE(flu.N_sa_Cl_tot)) + D_Cl.*(Vd+Vs)./(2.*dhod.^2.*Vs).*(state(ind.N_d_Cl)-state(ind.N_sa_Cl)));

%change in concentration of Na,K,Cl in the dendrite
dy(ind.N_d_Na)   = (-Ad./(F.*Vd).*(NE(flu.N_d_Na_tot))+ D_Na.*(Vs+Vd)./(2.*dhod.^2.*Vd).*(state(ind.N_sa_Na)-state(ind.N_d_Na)));
dy(ind.N_d_K)    = (-Ad./(F.*Vd).*(NE(flu.N_d_K_tot)) + D_K.*(Vs+Vd)./(2.*dhod.^2.*Vd).*(state(ind.N_sa_K)-state(ind.N_d_K)));
dy(ind.N_d_Cl)   = (-Ad./(F.*Vd).*(NE(flu.N_d_Cl_tot))+ D_Cl.*(Vs+Vd)./(2.*dhod.^2.*Vd).*(state(ind.N_sa_Cl)-state(ind.N_d_Cl)));

% % Potassium Buffer in the extracellular space
dy(ind.N_e_Kb_buffer)=((Mu.*state(ind.N_e_K).*(B0-state(ind.N_e_Kb_buffer))./(1+exp(-((state(ind.N_e_K)-5.5)./1.09))))-(Mu.*state(ind.N_e_Kb_buffer)));
dy(ind.N_s_Kb_buffer)=((Mu.*state(ind.N_s_K).*(B0-state(ind.N_s_Kb_buffer))./(1+exp(-((state(ind.N_s_K)-5.5)./1.09))))-(Mu.*state(ind.N_s_Kb_buffer)));

% change in concentration of Na,K,Cl in the extracellular space
dy(ind.N_e_Na)   = ((1./F*(((As.*NE(flu.N_sa_Na_tot))./(Vs.*0.15)) + ((Ad.*NE(flu.N_d_Na_tot))./(Vd.*0.15)))));
dy(ind.N_e_K)    = (((1./F*(((As.*NE(flu.N_sa_K_tot))./(Vs.*0.15))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*0.15))))))-dy(ind.N_e_Kb_buffer);%+7.5*rectpuls(time-20,10);
dy(ind.N_e_Cl)   = ((1./F*(((As.*NE(flu.N_sa_Cl_tot))./(Vs.*0.15)) + ((Ad.*NE(flu.N_d_Cl_tot))./(Vd.*0.15)))));



% dy(ind.N_s_K)=(((1./F*(((As.*NE(flu.N_sa_K_tot_s))./(Vs.*6.5417e-13))+((Ad.*NE(flu.N_d_K_tot_s))./(Vd.*2.5e-13))))));

% dy(ind.N_s_K)=(((1./F*(((As.*NE(flu.N_sa_K_tot))./(Vs.*6.5416e-7))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*2.5169e-7))))));

dy(ind.N_s_K)=k.*(((1./F*(((As.*NE(flu.N_sa_K_tot))./(Vs.*0.15))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*0.15))))))-dy(ind.N_s_Kb_buffer);

% dy(ind.N_s_K)=(((1./F*(((As.*NE(flu.N_sa_K_tot))./(Vs.*0.15))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*0.15))))))-dy(ind.N_e_Kb_buffer);

% dy(ind.N_s_K)=(((1./F*(((As.*NE(flu.N_sa_K_tot))./(Vs.*6.5417e-13))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*2.5e-13))))))-dy(ind.N_e_Kb_buffer);

dy(ind.N_e_Nae)   = (1./F.*(((As.*NE(flu.N_sa_Na_tot))./(Vs.*fe1)) + ((Ad.*NE(flu.N_d_Na_tot))./(Vd.*fe2)))).*1000.*AC(flu.R_s);%converting mM/s to uMm/s2.8e-8
dy(ind.N_e_Ke)    = (1./F.*(((As.*NE(flu.N_sa_K_tot))./(Vs.*fe1))+((Ad.*NE(flu.N_d_K_tot))./(Vd.*fe2)))-dy(ind.N_e_Kb_buffer)).*1000.*AC(flu.R_s);%converting mM/s to uMm/s

% % Neuron Model 2
% dy(ind.N2_Em)= -1./Cm2.*(NE(flu.N2_Na)+NE(flu.N2_K)+NE(flu.N2_Cl));
% dy(ind.N2_Na_h1)= 1000.*phi.*((NE(flu.N2_Na_h1a1).*(1-state(ind.N2_Na_h1)))- (NE(flu.N2_Na_h1b1)*state(ind.N2_Na_h1)));
% dy(ind.N2_K_n1)= 1000*phi.*((NE(flu.N2_K_n1a1).*(1-state(ind.N2_K_n1)))- (NE(flu.N2_K_n1b1)*state(ind.N2_K_n1)));
% dy(ind.N2_Nai)=( -4.45e-2.*(NE(flu.N2_Na))-3*NE(flu.N2_pump));
% dy(ind.N2_Ke)= ((4.45e-2.*NE(flu.N2_K)*Beta)-2.*Beta*NE(flu.N2_pump)-NE(flu.N2_glia)-NE(flu.N2_diffusion));
% dy(ind.N2_Cai)= -0.002*g_Ca*(state(ind.N2_Em)-En_Ca)./(1+exp(-(state(ind.N2_Em)+25)/2.5))-(state(ind.N2_Cai)/80);
% 
% dy(ind.N_e_Nae)   = ( 144- Beta.*(state(ind.N2_Nai)-18)).*1000.*2.8e-8;%AC(flu.R_s)
% dy(ind.N_e_Ke)    = ((4.45e-2.*NE(flu.N2_K)*Beta)-2.*Beta*NE(flu.N2_pump)-NE(flu.N2_glia)-NE(flu.N2_diffusion)).*1000.*2.8e-8;%AC(flu.R_s)

% % Morris lecar
% dy(ind.N3_Em)=-1./Cm3.*(g_mCa.*NE(flu.N3_m_inf).*(state(ind.N3_Em)-V_mCa)+g_mK.*state(ind.N3_w).*(state(ind.N3_Em)-V_K)+g_ML.*(state(ind.N3_Em)-V_L)-300*rectpuls(time-100,200));
% 
% dy(ind.N3_w)=phi3.*(NE(flu.N3_w_inf)-state(ind.N3_w))./NE(flu.N3_tauN);

%Oxygen Dependency

dy(ind.N_O2)= (NE(flu.V_CBF).*((O2_b-state(ind.N_O2))./(O2_b-O2_0)))-(CBF_init.*NE(flu.N_P_O2).*(1-gamm))-(CBF_init.*NE(flu.N_P_O2).*gamm.*((NE(flu.N_sa_r1_pump)+NE(flu.N_d_r1_pump))./(NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init))));

% BOLD response

dy(ind.B_CBV)=1/(tns+g).*(NE(flu.V_CBF_Norm)-(state(ind.B_CBV))^(1/0.4));
dy(ind.B_dhb)=1/tns.*(NE(flu.V_CMRO2_Norm)-(state(ind.B_dhb)./state(ind.B_CBV)).*(state(ind.B_CBV))^(1/0.4)-(state(ind.B_dhb)./state(ind.B_CBV)).*g.*dy(ind.B_CBV));


% Astrocyte
dy(ind.R_k     ) = L_p * (AC(flu.Na_k) + AC(flu.K_k) + AC(flu.Cl_k) + AC(flu.HCO3_k)...
             - AC(flu.Na_s) - AC(flu.K_s) - AC(flu.Cl_s) - AC(flu.HCO3_s) + X_k / state(ind.R_k));  % m s-1
       
            
dy(ind.N_Na_k  ) = -AC(flu.J_Na_k) - 3 * AC(flu.J_NaK_k) + AC(flu.J_NKCC1_k) + AC(flu.J_NBC_k );    % uMm s-1
dy(ind.N_K_k   ) = -AC(flu.J_K_k ) + 2 * AC(flu.J_NaK_k) + AC(flu.J_NKCC1_k) + AC(flu.J_KCC1_k)...
               -AC(flu.J_BK_k); % uMm s-1
          
            
            
            
dy(ind.N_HCO3_k) = 2 * AC(flu.J_NBC_k);                                                 % uMm s-1
dy(ind.N_Cl_k  ) = dy(ind.N_Na_k) + dy(ind.N_K_k) - dy(ind.N_HCO3_k);                           % uMm s-1, modified equation compared to the one of Ostby

% dy(ind.N_Na_s  ) = - k_C * getRef(time,'ft') -dy(ind.N_Na_k);%original NVU input
% dy(ind.N_Na_s  ) = -(((1./F*(((As.*NE(flu.N_sa_K_tot_s))./(Vs.*6.5417e-13))+((Ad.*NE(flu.N_d_K_tot_s))./(Vd.*2.5e-13))))).*1000.*2.8e-8)- dy(ind.N_Na_k) ;% uMm s-1 % New input from neuron model

% dy(ind.N_Na_s  ) = -(dy(ind.N_s_K).*1000.*2.8e-8)- dy(ind.N_Na_k) ;% uMm s-1 % New input from neuron model

dy(ind.N_Na_s  ) = -(dy(ind.N_s_K).*1000.*2.8e-8)- dy(ind.N_Na_k) ;% uMm s-1 % New input from neuron model


% dy(ind.N_K_s   ) = k_C * getRef(time,'ft') - dy(ind.N_K_k) ;
% dy(ind.N_K_s   ) =(((1./F*(((As.*NE(flu.N_sa_K_tot_s))./(Vs.*6.5417e-13))+((Ad.*NE(flu.N_d_K_tot_s))./(Vd.*2.5e-13))))).*1000.*2.8e-8)- dy(ind.N_K_k) ;% uMm s-1

% dy(ind.N_K_s   ) =(dy(ind.N_s_K).*1000.*2.8e-8)- dy(ind.N_K_k) ;% uMm s-1

dy(ind.N_K_s   ) =(dy(ind.N_s_K).*1000.*2.8e-8)- dy(ind.N_K_k) ;% uMm s-1

dy(ind.N_HCO3_s) = - dy(ind.N_HCO3_k);                                                  % uMm s-1
dy(ind.K_p     ) = AC(flu.J_BK_k) / (VR_pa*state(ind.R_k))+ (SMC(flu.J_KIR_i))/(VR_ps)-R_decay.*(state(ind.K_p)-K_min);     % uM s-1
dy(ind.w_k     ) = AC(flu.phi_w) * (AC(flu.w_inf) - state(ind.w_k));                            % s-1

% Smooth muscle cell
dy(ind.Ca_i)    = SMC(flu.Ca_coup_i) + SMC(flu.rho_i) * (SMC(flu.J_CICR_i) + SMC(flu.J_IP3_i) + SMC(flu.J_leak_i) - SMC(flu.J_SRuptake_i) - SMC(flu.J_extrusion_i)...
    - SMC(flu.J_VOCC_i) + SMC(flu.J_NaCa_i) + 0.1*SMC(flu.J_stretch_i));
dy(ind.s_i) 	= (- SMC(flu.J_CICR_i) - SMC(flu.J_leak_i) + SMC(flu.J_SRuptake_i)) ;
dy(ind.v_i)     = SMC(flu.v_coup_i) + gam * (-SMC(flu.J_NaK_i) - SMC(flu.J_Cl_i) - 2*SMC(flu.J_VOCC_i) - SMC(flu.J_NaCa_i) - SMC(flu.J_K_i) - SMC(flu.J_stretch_i) - SMC(flu.J_KIR_i));
dy(ind.w_i) 	= lab * (SMC(flu.Kactivation_i) - state(ind.w_i));
dy(ind.I_i) 	= SMC(flu.IP3_coup_i) - SMC(flu.J_degrad_i)  ; 

dy(ind.K_i)     = - SMC(flu.J_KIR_i) - SMC(flu.J_K_i) + SMC(flu.J_NaK_i);                                            % uM s-1

% Endothelium cell
dy(ind.Ca_j)	= EC(flu.Ca_coup_j) + EC(flu.rho_j) * (EC(flu.J_IP3_j) - EC(flu.J_ERuptake_j) + EC(flu.J_CICR_j) - EC(flu.J_extrusion_j) + EC(flu.J_leak_j)...
    + EC(flu.J_cation_j) + EC(flu.J_0_j) + EC(flu.J_stretch_j));
dy(ind.s_j) 	= EC(flu.J_ERuptake_j) - EC(flu.J_CICR_j) - EC(flu.J_leak_j) ;
dy(ind.v_j) 	=  - 1/C_m * ( EC(flu.J_K_j)	+ EC(flu.J_R_j) ) + EC(flu.v_coup_j);	
dy(ind.I_j) 	= EC(flu.IP3_coup_j) + J_PLC - EC(flu.J_degrad_j)  ;

% Myosin crossbridge model

dy(ind.Mp)      = K4_c*state(ind.AMp) + SMC(flu.K1_c) *SMC(flu.M) - (K2_c + K3_c)*state(ind.Mp);
dy(ind.AMp)     = K3_c*state(ind.Mp) + SMC(flu.K6_c) *state(ind.AM) - (K4_c + K5_c)*state(ind.AMp);  % K7_c was corrected to K4_c
dy(ind.AM)      = K5_c*state(ind.AMp) - (K7_c + SMC(flu.K6_c) )*state(ind.AM);

% Radius change

%Kevin Voigt

F_r=state(ind.AMp) + state(ind.AM);

E_r = Epas_r + F_r*(Eact_r -Epas_r);
R0_r= R0pas_r + F_r*R0pas_r*(0.6 - 1);


dy(ind.R)= R0pas_r/nu_r *(state(ind.R)*P_r/SMC(flu.h_r) - E_r * ((state(ind.R) - R0_r)/R0_r));
% % 
% % if F_r1 <= 0.4
% %     F_r = 0.4;
% % else
% %     F_r = F_r1;
% % end
% 
% %dy(ind.R)       = 1/nu_r *( R0pas_r*state(ind.R)*P_r /SMC(flu.h_r)  - Epas_r * ( state(ind.R) - R0pas_r)...
% %    - F_r/0.8 * ((Etot_r - Epas_r) * state(ind.R) + Epas_r*R0pas_r - Etot_r*R0act_r));
% 
% 
% %Koningsberger
% % siga_r = siga0_r *((state(AMp) + state(AM))/0.8) * exp(-ka_r *(statestate(R)+h_r-ra_r)^2);
% % 
% % if state(R) >= r0_r
% %     sigp_r = sigp0_r * (exp(kp_r * (state(R)-r0_r)) -1);
% % else
% %     sigp_r = sigp0_r * kp_r * (1 - (state(R)^2/r0_r^2)^(-3/2));
% % end
% % 
% % 
% % dy(R)       = 1/nu_r * ( P_r*state(R)/h_r - sigp_r - siga_r);

end