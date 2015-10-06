# df1 <- data.frame(id = 1:5, fact1 = factor(c('abc','def', NA, 'NA','')))
# 2-2 Disease
Hyper.DI1_pr  <- ifelse(DI1_dg==0,  0, ifelse(DI1_dg==9,  "", ifelse(DI1_pr==0,  0, 1))) # 2-2-2 Hypertension (고혈압)
Lip.DI2_pr    <- ifelse(DI2_dg==0,  0, ifelse(DI2_dg==9,  "", ifelse(DI2_pr==0,  0, 1))) # 2-2-3 Lipidemia (이상지혈증)
Myo.DI5_pr    <- ifelse(DI5_dg==0,  0, ifelse(DI5_dg==9,  "", ifelse(DI5_pr==0,  0, 1))) # 2-2-5 Myocardial (심근경색증)
Ang.DI6_pr    <- ifelse(DI6_dg==0,  0, ifelse(DI6_dg==9,  "", ifelse(DI6_pr==0,  0, 1))) # 2-2-5 Angina (협심증)
Ast.DJ4_pr    <- ifelse(DJ4_dg==0,  0, ifelse(DJ4_dg==9,  "", ifelse(DJ2_pr==0,  0, 1))) # 2-2-8 Asthma (천식)
Dia.DE1_pr    <- ifelse(DE1_dg==0,  0, ifelse(DE1_dg==9,  "", ifelse(DE1_pr==0,  0, 1))) # 2-2-9 Diabetics (당뇨병)

p2.2 <- data.frame(Hyper.DI1_pr, Lip.DI2_pr, Myo.DI5_pr, Ang.DI6_pr, Ast.DJ4_pr, Dia.DE1_pr)
							 
							 
Hyper.DI1_pr  <- ifelse(DI1_pr==0, 0,  ifelse(DI1_dg== 1, 1, "")) # 2-2-2 Hypertension (고혈압)
Lip.DI2_pr    <- ifelse(DI2_pr==0, 0,  ifelse(DI2_dg== 1, 1, "")) # 2-2-3 Lipidemia (이상지혈증)
Myo.DI5_pr    <- ifelse(DI5_pr==0, 0,  ifelse(DI5_dg== 1, 1, "")) # 2-2-5 Myocardial (심근경색증)
Ang.DI6_pr    <- ifelse(DI6_pr==0, 0,  ifelse(DI6_dg== 1, 1, "")) # 2-2-5 Angina (협심증)
Dia.DE1_pr    <- ifelse(DE1_pr==0, 0,  ifelse(DE1_dg== 1, 1, "")) # 2-2-9 Diabetics (당뇨병)

Disease.Var2.2 <- data.frame(Hyper.DI1_pr, Lip.DI2_pr, Myo.DI5_pr, Ang.DI6_pr, Dia.DE1_pr)
							 
# 3-1 검진 기본 조사 
HE3_HPdg   <- ifelse (HE_HPdg  ==0, 0, 1) # 고혈압 의사진단 여부
HE3_DMdg   <- ifelse (HE_DMdg  ==0, 0, 1) # 당뇨병 의사진단 여부
HE3_HLdg   <- ifelse (HE_HLdg  ==0, 0, 1) # 고지혈증 의사진단 여부

p3.1 <- data.frame(HE3_HPdg,HE3_DMdg,HE3_HLdg)

# 3-2 혈압측정, 3-3 비만(Obesty), 3-4 혈액(당뇨, 이상지질혈증, 간기능, 빈혈)
Obesity.y  <- ifelse( (sex==1 & HE_wc > 102)|(sex==2 & HE_wc > 85), 1, 0)
Trigly.y   <- ifelse(HE_TG >=150, 1, 0)
CholHigh.y <- ifelse((sex==1 & HE_HDL < 40) | (sex==2 & HE_HDL < 50), 1, 0)
Dia.y      <- ifelse(HE_glu >= 110 | DE1_3==1, 1, 0) 
Hyper.y    <- ifelse(HE_sbp1>=130 | HE_dbp1 >=85, 1,0)

y_all <- data.frame(Obesity.y, Trigly.y, CholHigh.y, Dia.y, Hyper.y) #[복부비만, 중성지방, 콜레스트롤, 혈당, 혈압]

#
c <- data.frame(as.integer(p2.2), p3.1, y_all)

#
o <- tetrachoric (, na.rm=TRUE)
