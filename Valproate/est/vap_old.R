require(nortest)
karol_vap=read.csv("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/karol_vap.csv",sep=";",dec=".")
ad.karol_vap=ad.test(array(karol_vap[,1],dim=c(10,8)))
karol_vap1=read.csv("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/karol_vap1.csv",sep=";",dec=".")
karol_vap2=read.csv("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/karol_vap2.csv",sep=";",dec=".")
karol_res_vpa=read.csv("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/karol_res_vap.csv",sep=";",dec=".")
aov.karol_vap=aov(Time.s.~Treat,data=karol_vap)
bon.karol_vap=pairwise.t.test(karol_vap$Time.s.,karol_vap$Treat,p.adj="bonferroni")
tuk.karol_vap=TukeyHSD(aov.karol_vap)
aov.karol_vap1=aov(Time.s.~Treat,data=karol_vap1)
bon.karol_vap1=pairwise.t.test(karol_vap1$Time.s.,karol_vap1$Treat,p.adj="bonferroni")
tuk.karol_vap1=TukeyHSD(aov.karol_vap1)
aov.karol_vap2=aov(Time.s.~Treat,data=karol_vap2)
bon.karol_vap2=pairwise.t.test(karol_vap2$Time.s.,karol_vap2$Treat,p.adj="bonferroni")
tuk.karol_vap2=TukeyHSD(aov.karol_vap2)
aov.karol_res_vpa=aov(Time.s.~Treat,data=karol_res_vpa)
bon.karol_res_vpa=pairwise.t.test(karol_res_vpa$Time.s.,karol_res_vpa$Treat,p.adj="bonferroni")
tuk.karol_res_vpa=TukeyHSD(aov.karol_res_vpa)
mn.t.res.vpa=tapply(karol_res_vpa$Time.s.,karol_res_vpa$Treat,mean)
sd.t.res.vpa=tapply(karol_res_vpa$Time.s.,karol_res_vpa$Treat,sd)
se.t.res.vpa=tapply(karol_res_vpa$Time.s.,karol_res_vpa$Treat,sd)/sqrt(10)

edema=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/vap_edema.csv")
edema$t1=edema$T1-edema$T0
edema$t2=edema$T2-edema$T0
edema$t3=edema$T3-edema$T0
edema$t4=edema$T4-edema$T0
edema$t24=edema$T24-edema$T0

aov.edemaT0=aov(T0~Treat,data=edema)
tuk.edemaT0=TukeyHSD(aov.edemaT0)
aov.edemat1=aov(t1~Treat,data=edema)
tuk.edemat1=TukeyHSD(aov.edemat1)
aov.edemat2=aov(t2~Treat,data=edema)
tuk.edemat2=TukeyHSD(aov.edemat2)
aov.edemat3=aov(t3~Treat,data=edema)
tuk.edemat3=TukeyHSD(aov.edemat3)
aov.edemat4=aov(t4~Treat,data=edema)
tuk.edemat4=TukeyHSD(aov.edemat4)
aov.edemat24=aov(t24~Treat,data=edema)
tuk.edemat24=TukeyHSD(aov.edemat24)

attach(edema)
ed.mean=matrix(cbind(c(tapply(t1,Treat,mean),tapply(t2,Treat,mean),tapply(t3,Treat,mean),tapply(t4,Treat,mean),tapply(t24,Treat,mean))),nrow=4)[c(1,2,4,3),]
ed.sd=matrix(cbind(c(tapply(t1,Treat,sd),tapply(t2,Treat,sd),tapply(t3,Treat,sd),tapply(t4,Treat,sd),tapply(t24,Treat,sd))),nrow=4)[c(1,2,4,3),]
ed.se=matrix(cbind(c(tapply(t1,Treat,sd),tapply(t2,Treat,sd),tapply(t3,Treat,sd),tapply(t4,Treat,sd),tapply(t24,Treat,sd))),nrow=4)[c(1,2,4,3),]/sqrt(6)

plot(matrix(ed.mean,nrow=4)[c(1,2,4,3),][1,],ylim=c(-0.02,0.15),type="o",bty="n",xaxt="n",xlab="Time after treatment (h)",ylab="Edema (ml)")
axis(1,at=1:5,labels=c("1","2","3","4","24"))
lines(ed.mean[2,],type="o",pch=0)
lines(ed.mean[3,],type="o",pch=2)
lines(ed.mean[4,],type="o",pch=5)
arrows(c(1,2,3,4,5,6),ed.mean[1,],c(1,2,3,4,5,6),ed.mean[1,]+ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[2,],c(1,2,3,4,5,6),ed.mean[2,]+ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[3,],c(1,2,3,4,5,6),ed.mean[3,]+ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[4,],c(1,2,3,4,5,6),ed.mean[4,]+ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[1,],c(1,2,3,4,5,6),ed.mean[1,]-ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[2,],c(1,2,3,4,5,6),ed.mean[2,]-ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[3,],c(1,2,3,4,5,6),ed.mean[3,]-ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
arrows(c(1,2,3,4,5,6),ed.mean[4,],c(1,2,3,4,5,6),ed.mean[4,]-ed.se[1,],code=2,angle=90,lty=1,lwd=1,length=0.05)
points(ed.mean[4,]+c(0,-0.025,0,-0.022,-0.031),pch=8,col=c(0,1,0,1,1))
points(1.05,0.024,pch=8)
points(0.95,0.024,pch=8)
points(3.05,0.046,pch=8)
points(2.95,0.046,pch=8)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/edema.ps',height=8.5,width=8.5,paper="letter",horiz=F)
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/edema.jpg',height=600,width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/edema.tif',height=600,width=600)
dev.off()
detach(edema)

rb=boxplot(Time.s.~Treat,data=karol_vap,outline=F,ylim=c(0,35),names=c("CONT","SHAM","VPA 10","VPA 25","VPA 50","VPA 100","AMI 10","INDO 10"),ylab="Reaction Time (s)")
mn.v=tapply(karol_vap$Time.s.,karol_vap$Treat,mean)
sd.v=tapply(karol_vap$Time.s.,karol_vap$Treat,sd)
se.v=tapply(karol_vap$Time.s.,karol_vap$Treat,sd)/sqrt(10)
xi=seq(rb$n)
points(mn.v,pch=18)
points(4.9,30,pch=8)
points(5,30,pch=8)
points(5.1,30,pch=8)
points(7.95,30,pch=8)
points(8.05,30,pch=8)
points(mn.v-sd.v,pch=18)
points(mn.v+sd.v,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap.jpg',width=900)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap.tif',width=900)
dev.off()
par(cex=1.2)
rb.1=boxplot(Time.s.~Treat,data=karol_vap1,outline=F,ylim=c(0,35),names=c("CONT","SHAM","VPA 50","AMI 10","INDO 10"),ylab="Reaction Time (s)")
mn.v.1=tapply(karol_vap1$Time.s.,karol_vap1$Treat,mean)
sd.v.1=tapply(karol_vap1$Time.s.,karol_vap1$Treat,sd)
se.v.1=tapply(karol_vap1$Time.s.,karol_vap1$Treat,sd)/sqrt(10)
xi.1=seq(rb.1$n)
points(mn.v.1,pch=18)
points(2,30,pch=8)
points(2.9,30,pch=8)
points(3,30,pch=8)
points(3.1,30,pch=8)
points(4,30,pch=8)
points(4.95,30,pch=8)
points(5.05,30,pch=8)
points(mn.v.1-sd.v.1,pch=18)
points(mn.v.1+sd.v.1,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap1.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap1.jpg',width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap1.tif',width=600)
dev.off()
rb.2=boxplot(Time.s.~Treat,data=karol_vap2,outline=F,ylim=c(0,35),names=c("CONT","VPA 10","VPA 25","VPA 50","VPA 100"),ylab="Reaction Time (s)")
mn.v.2=tapply(karol_vap2$Time.s.,karol_vap2$Treat,mean)
sd.v.2=tapply(karol_vap2$Time.s.,karol_vap2$Treat,sd)
se.v.2=tapply(karol_vap2$Time.s.,karol_vap2$Treat,sd)/sqrt(10)
xi.2=seq(rb.2$n)
points(mn.v.2,pch=18)
points(3,30,pch=8)
points(3.9,30,pch=8)
points(4,30,pch=8)
points(4.1,30,pch=8)
points(mn.v.2-sd.v.2,pch=18)
points(mn.v.2+sd.v.2,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap2.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap2.jpg',width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap2.tif',width=600)
dev.off()
rb.b=barplot(mn.v,lwd=2,col=NA,ylim=c(0,22),names.arg=c("CONT","SHAM","VPA 10","VPA 25","VPA 50","VPA 100","AMI 10","INDO 10"),ylab="Reaction Time (s)")
arrows(rb.b,mn.v,rb.b,mn.v+sd.v,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(5.35,20,pch=8)
points(5.5,20,pch=8)
points(5.65,20,pch=8)
points(9.1,20,pch=8)
points(10.25,20,pch=8)
points(10.35,20,pch=8)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar.jpg',width=900)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar.tif',width=900)
dev.off()
rb.b.1=barplot(mn.v.1,lwd=3,col=NA,ylim=c(0,22),names.arg=c("CONT","SHAM","VPA 50","AMI 10","INDO 10"),ylab="Reaction Time (s)")
arrows(rb.b.1,mn.v.1,rb.b.1,mn.v.1+sd.v.1,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(1.9,13,pch=8)
points(2.95,20.6,pch=8)
points(3.1,20.6,pch=8)
points(3.25,20.6,pch=8)
points(4.3,16.5,pch=8)
points(5.43,19.5,pch=8)
points(5.58,19.5,pch=8)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar1.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar1.jpg',width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar1.tif',width=600)
dev.off()
rb.b.2=barplot(mn.v.2,lwd=2,col=NA,ylim=c(0,22),names.arg=c("CONT","VPA 10","VPA 25","VPA 50","VPA 100"),ylab="Reaction Time (s)")
arrows(rb.b.2,mn.v.2,rb.b.2,mn.v.2+sd.v.2,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(3.1,17,pch=8)
points(4.15,21,pch=8)
points(4.3,21,pch=8)
points(4.45,21,pch=8)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar2.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar2.jpg',width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/karol_vap_bar2.tif',width=600)
dev.off()

contor=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/vap_cont.csv")
aov.contor=aov(contor$C~contor$Treat)
tuk.contor=TukeyHSD(aov.contor)
rb.cv=boxplot(C~Treat,data=contor,outline=F,names=c("CONT","VPA 10","VPA 25","VPA 100"),ylab="Writhings")
mn.cv=tapply(contor$C,contor$Treat,mean)
sd.cv=tapply(contor$C,contor$Treat,sd)
se.cv=tapply(contor$C,contor$Treat,sd)/sqrt(c(10,9,7,9))
xi.cv=seq(rb.cv$n)
points(mn.cv,pch=18)
points(4,38,pch=8)
points(3.1,43,pch=8)
points(3.0,43,pch=8)
points(2.9,43,pch=8)
points(mn.cv-sd.cv,pch=18)
points(mn.cv+sd.cv,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box.tif')
dev.off()
rb.b.cv=barplot(mn.cv,lwd=2,col=NA,ylim=c(0,70),names.arg=c("CONT","VPA 10","VPA 25","VPA 100"),ylab="Writhings")
arrows(rb.b.cv,mn.cv,rb.b.cv,mn.cv+sd.cv,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(4.3,35,pch=8)
points(3.1,32,pch=8)
points(3.0,32,pch=8)
points(3.2,32,pch=8)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar.tif')
dev.off()

old.par=par(mfcol=c(2,1),mai=c(1,2,1,2))
rb.b.1=barplot(mn.v.1,lwd=3,col=NA,ylim=c(0,22),names.arg=c("CONT","SHAM","VPA 50","AMI 10","INDO 10"),ylab="Reaction Time (s)")
arrows(rb.b.1,mn.v.1,rb.b.1,mn.v.1+sd.v.1,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(1.9,13,pch=8)
points(2.95,20.6,pch=8)
points(3.1,20.6,pch=8)
points(3.25,20.6,pch=8)
points(4.3,16.5,pch=8)
points(5.45,19.5,pch=8)
points(5.6,19.5,pch=8)
text(1,21,"A",cex=2)
rb.b.2=barplot(mn.v.2,lwd=2,col=NA,ylim=c(0,22),names.arg=c("CONT","VPA 10","VPA 25","VPA 50","VPA 100"),ylab="Reaction Time (s)")
arrows(rb.b.2,mn.v.2,rb.b.2,mn.v.2+sd.v.2,code=2,angle=90,lty=1,lwd=1,length=0.1)
points(3.1,17,pch=8)
points(4.15,21,pch=8)
points(4.3,21,pch=8)
points(4.45,21,pch=8)
text(1,21,"B",cex=2)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/vap_fig1.ps',height=11,width=8.5,paper="letter",horiz=F)
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/vap_fig1.jpg',height=800,width=600)
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/vap_fig1.tif',height=800,width=600)
dev.off()
par(old.par)

contor2=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/vap_cont_2.csv")
aov.contor2=aov(contor2$C~contor2$Treat)
tuk.contor2=TukeyHSD(aov.contor2)

rb.cv2=boxplot(C~Treat,data=contor2,outline=F,names=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings")
mn.cv2=tapply(contor2$C,contor2$Treat,mean)
sd.cv2=tapply(contor2$C,contor2$Treat,sd)
se.cv2=tapply(contor2$C,contor2$Treat,sd)/sqrt(6)
xi.cv2=seq(rb.cv2$n)
points(mn.cv2,pch=18)
points(mn.cv2-sd.cv2,pch=18)
points(mn.cv2+sd.cv2,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box2.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box2.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box2.tif')
dev.off()

rb.b.cv2=barplot(mn.cv2,lwd=2,col=NA,ylim=c(0,70),names.arg=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings")
arrows(rb.b.cv2,mn.cv2,rb.b.cv2,mn.cv2+sd.cv2,code=2,angle=90,lty=1,lwd=1,length=0.1)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar2.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar2.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar2.tif')
dev.off()

contor3=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/vap_cont_3.csv")
aov.contor3=aov(contor3$C~contor3$Treat)
tuk.contor3=TukeyHSD(aov.contor3)

rb.cv3=boxplot(C~Treat,data=contor3,outline=F,names=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings")
mn.cv3=tapply(contor3$C,contor3$Treat,mean)
sd.cv3=tapply(contor3$C,contor3$Treat,sd)
se.cv3=tapply(contor3$C,contor3$Treat,sd)/sqrt(6)
xi.cv3=seq(rb.cv3$n)
points(mn.cv3,pch=18)
points(mn.cv3-sd.cv3,pch=18)
points(mn.cv3+sd.cv3,pch=18)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box3.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box3.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_box3.tif')
dev.off()

rb.b.cv3=barplot(mn.cv3,lwd=2,col=NA,ylim=c(0,70),names.arg=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings")
arrows(rb.b.cv3,mn.cv3,rb.b.cv3,mn.cv3+sd.cv3,code=2,angle=90,lty=1,lwd=1,length=0.1)
dev.copy(postscript,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar3.ps')
dev.off()
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar3.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar3.tif')
dev.off()

old.par=par(mfcol=c(2,1))
rb.b.cv2=barplot(mn.cv2,lwd=2,col=NA,ylim=c(0,70),names.arg=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings",main="Male")
arrows(rb.b.cv2,mn.cv2,rb.b.cv2,mn.cv2+sd.cv2,code=2,angle=90,lty=1,lwd=1,length=0.1)
rb.b.cv3=barplot(mn.cv3,lwd=2,col=NA,ylim=c(0,70),names.arg=c("CONT","VPA 10","VPA 25","VPA 100","VPA 250","MORF 5"),ylab="Writhings",main="Female")
arrows(rb.b.cv3,mn.cv3,rb.b.cv3,mn.cv3+sd.cv3,code=2,angle=90,lty=1,lwd=1,length=0.1)
dev.copy2eps(horizontal=F,height=3.5*2,width=3.5,file='/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar4.eps')
dev.copy(jpeg,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar4.jpg')
dev.off()
dev.copy(tiff,'/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/graphs/contor_bar4.tif',height=4200,width=2200,res=300,compression="lzw")
dev.off()
par(old.par)

vap_hp=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/Pain/Valproate/est/vap_hp.csv")
#ad.karol_res_vpa=ad.test(array(karol_res_vpa[,1],dim=c(10,6)))
attach(vap_hp)
aov.vap0=aov(T0~Treat)
tuk.vap0=TukeyHSD(aov(T0~Treat))
aov.vap30=aov(T30~Treat)
tuk.vap30=TukeyHSD(aov(T30~Treat))
aov.vap60=aov(T60~Treat)
tuk.vap60=TukeyHSD(aov(T60~Treat))
aov.vap90=aov(T90~Treat)
tuk.vap90=TukeyHSD(aov(T90~Treat))
aov.vap120=aov(T120~Treat)
tuk.vap120=TukeyHSD(aov(T120~Treat))
aov.vap150=aov(T150~Treat)
tuk.vap150=TukeyHSD(aov(T150~Treat))
aov.vap180=aov(T180~Treat)
tuk.vap180=TukeyHSD(aov(T180~Treat))
