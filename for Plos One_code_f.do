
*Paper title: The effect of the synchronized multi-dimensional policies on imported COVID-19 curtailment in China
*Authors: Zhenhua Chen*, Meng Yu, Yuxuan Wang, Lei Zhou
*Corresponding:chen.7172@osu.edu  
*Journal of publication: Plos One
*Acceptance date: May 12, 2021



*1-Export descriptive stats 
*see SI Appendix, table S2. Descriptive statistics of all variables

ssc install asdoc, replace

asdoc sum v8n   v2 v3 v4 v5 v6 v7 v9 v12 v14 v15 ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48  ///
          p311bjr p313shr p316bjr p317shr p317ynr p317xar p319gdr p321tj p325bj p326sh p327yn p327gd p328xa p402hlj p407hlj pfl pfr ///
          tourist student resident job 
		  
*2-Verify conditional variance and mean for each policy 
*see SI Appendix, table S3. Comparison of the conditional variance and conditional mean of policy variables
ssc install estout, replace

quietly estpost tabstat v8n, by(p311bjr) stats(mean v n)
estout using p311bjr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p313shr) stats(mean v n)
estout using p313shr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p316bjr) stats(mean v n)
estout using p316bjr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p317shr) stats(mean v n)
estout using p317shr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p317ynr) stats(mean v n)
estout using p317ynr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p317xar) stats(mean v n)
estout using p317xar.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p319gdr) stats(mean v n)  
estout using p319gdr.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p321tj) stats(mean v n)  
estout using p321tj.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p325bj) stats(mean v n)  
estout using p325bj.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p326sh) stats(mean v n)  
estout using p326sh.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p327yn) stats(mean v n)  
estout using p327yn.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p327gd) stats(mean v n)  
estout using p327gd.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p328xa) stats(mean v n)  
estout using p328xa.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p402hlj) stats(mean v n)  
estout using p402hlj.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(p407hlj) stats(mean v n)  
estout using p407hlj.rtf, cells("mean variance count")

quietly estpost tabstat v8n, by(pfl) stats(mean v n)
estout using pfl.rtf, cells("mean variance count") 

quietly estpost tabstat v8n, by(pfr) stats(mean v n)  
estout using pfr.rtf, cells("mean variance count")

*3-Pearson correlation coefficient of "policy variables"; "key+control variables" and "country variables".  
*see SI Appendix, table S4. Pearson correlation table of policy variables.

set cformat %7.2f
pwcorr p311bjr p313shr p316bjr p317shr p317ynr p317xar p319gdr p321tj p325bj p326sh p327yn p327gd p328xa p402hlj p407hlj pfl pfr, sig star(.05) //The output contains two important pieces of information: (1) the Pearson correlation coefficient; and (2) the level of statistical significance (the p-value at the .05 level)
logout, save(PC_coeff_policy) word replace: pwcorr p311bjr p313shr p316bjr p317shr p317ynr p317xar p319gdr p321tj p325bj p326sh p327yn p327gd p328xa p402hlj p407hlj pfl pfr 

pwcorr v2 v3 v4 v5_1 v6 v7 v9 v12 v14 v15 resident student tourist job, sig star(.05) //The output contains two important pieces of information: (1) the Pearson correlation coefficient; and (2) the level of statistical significance (the p-value at the .05 level)
logout, save(PC_coeff_KeyCtrl) word replace: pwcorr v2 v3 v4 v5_1 v6 v7 v9 v12 v14 v15 resident student tourist job 

pwcorr ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
       ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
       ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
       ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
       ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, sig star(.05)  // , sig star(.05) //The output contains two important pieces of information: (1) the Pearson correlation coefficient; and (2) the level of statistical significance (the p-value at the .05 level)
logout, save(PC_coeff_country) word replace: pwcorr ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
                                                    ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
                                                    ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
                                                    ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
                                                    ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48 

***Based on Pearson correlation, variables identified in high correlations are: v15/v5_1=0.54; pfr/p326sh=0.58; pfr/p402hlj=-0.53


*4-Estimate marginal effects of policies in chronological order(sensitivity test) 
*Note: 
     *(1)syntax "margins, dydx(varlist),atmeans" is for marginal effect at treatment level;
	 *if matrix has missing values, possion model cannot run "margins, dydx atmeans post";
	 *(2)the difference between the two nbreg commands from m1 to m14 is the change of reference category:
	 *"ib.pfl" is to estimate the model with category 2 as the reference category (instead of category 1), and i.pfl takes category 1 as baseline.   



*model comparison xtpoisson fe, xtnbreg fe and xtnbreg
*step-1:all var; 
*step-2:remove v15 (pc value >0.50 and not significant);
*step-3:remove pfr when p402hlj is implemented (due to pc value> |0.5|)
*step-4:replace pfr =0 for Shanghai when p326sh is implemented (due to pc value >0.5)
*step-5:calculate margins
*step-6:6.1 remove v3 and i.job, calculate margins with ocountries and travel purpose; 6.2 remove v3 and i.student, calculate margins with countries and travel purpose
*step-7: remove v3 and travel purposs, calculate margins with countries 
*step-8: remove v3 and travel purpose, policies are combined in one model for those adopted on the same day, calcuate margins with countries

xtset cityid 

///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2 i.v9 i.v12  ///
///i.v4 i.v6 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr /// 
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m00

xtnbreg v8n  i.v2 i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
/// i.resident i.student i.tourist i.job
i.p311bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx( i.v2 i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.student i.tourist i.job
i.p311bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m01

///xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
///margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
///estimates store m02



///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2  i.v9 i.v12 ///
///i.v4  i.v6 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
         //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
         //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m10

xtnbreg v8n i.v2  i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student  
i.p311bjr i.p313shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m11

///xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
///margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
///estimates store m12



///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2 i.v9 i.v12  ///
///i.v4  i.v6  /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr /// 
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m20

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m21

///xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
///margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
///estimates store m22



///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2  i.v9 i.v12  ///
///i.v4  i.v6  /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr ///
         //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
         //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
         // i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
         //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
         //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m30

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m31

///xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
///margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
///estimates store m32



///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2  i.v9 i.v12  ///
///i.v4  i.v6  /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr /// 
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m40

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m41

///xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
///margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
///estimates store m42



///xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
///i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
///margins, dydx(i.v2  i.v9 i.v12  ///
///i.v4  i.v6  /// v15 
///i.resident i.student i.tourist i.job ///
///i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar /// 
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
///estimates store m50

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2 i.v9 i.v12 v14 ///v3 
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m51

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
         // ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m52



//xtpoisson v8n i.v2  i.v9 i.v12 v14 ///v3
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist  ///i.job
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m60

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m61

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
         // ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
         // ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
         // ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
         //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m62


//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2 i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m70

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m71

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m72



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl /// 
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m80

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m81

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m82



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m90

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m91

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m92



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m100

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m101

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m102



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m200

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.tourist i.job  i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m201

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m202



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m300

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m301

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m302



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48)
//estimates store m400

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m401

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48 
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m402



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48 , robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48) 
//estimates store m500

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m501

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.pfl i.pfr ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48 ) atmeans post
//estimates store m502



//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.pfr
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
         //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
         //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
         //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48 , robust fe
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 i.pfr
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48) 
//estimates store m600

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident   i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe 
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m601

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.pfr
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48 
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.pfr
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m602




//xtpoisson v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.prf
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48, robust fe  
//margins, dydx(i.v2  i.v9 i.v12  ///
//i.v4  i.v6  /// v15 i.prf
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          //i.ocountry1  i.ocountry2  i.ocountry3  i.ocountry4  i.ocountry5  i.ocountry6  i.ocountry7  i.ocountry8  i.ocountry9  i.ocountry10 /// 
          //i.ocountry11 i.ocountry12 i.ocountry13 i.ocountry14 i.ocountry15 i.ocountry16 i.ocountry17 i.ocountry18 i.ocountry19 i.ocountry20  ///
          //i.ocountry21 i.ocountry22 i.ocountry23 i.ocountry24 i.ocountry25 i.ocountry26 i.ocountry27 i.ocountry28 i.ocountry29 i.ocountry30  ///
          //i.ocountry31 i.ocountry32 i.ocountry33 i.ocountry34 i.ocountry35 i.ocountry36 i.ocountry37 i.ocountry38 i.ocountry39 i.ocountry40  ///
          //i.ocountry41 i.ocountry42 i.ocountry43 i.ocountry44 i.ocountry45 i.ocountry46 i.ocountry47 i.ocountry48) 
//estimates store m700

xtnbreg v8n  i.v2 i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job 
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 
		  ocountry48, fe 
margins, dydx(i.v2 i.v9 i.v12 v14 ///v3 
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 
		  ocountry48) atmeans post
estimates store m701

//xtnbreg v8n i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.prf
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48  
//margins, dydx(i.v2 v3 i.v9 i.v12 v14 ///
//i.v4 v5_1 i.v6 v7 /// v15 i.prf
//i.resident i.student i.tourist i.job ///
//i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj i.pfl ///
          //ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          //ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          //ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          //ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          //ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
//estimates store m702


esttab m01 ///m00  m02 
       m11 ///m10  m12 
	   m21 ///m20  m22 
	   m31 ///m30  m32 
	   m41 ///m40  m42 
	   m51 ///m50  m52 
	   m61 ///m60  m62 
	   m71 ///m70  m72 
	   m81 ///m80  m82 
	   m91 ///m90  m92 
	   m101 ///m100  m102 
	   m201 ///m200  m202 
	   m301 ///m300  m302 
	   m401 ///m400  m402 
	   m501 ///m500  m502 
	   m601 ///m600  m602 
	   m701 ///m700  m702 
using 对比8.csv, replace nogaps wide b(%12.2f) t(2) r2(3) star(* 0.10 ** 0.05 *** 0.01) title("") mtitles("11Mar" "13Mar" "16Mar" "17Mar" "17Mar" "17Mar" "19Mar" "21Mar" "25Mar" "26Mar" "27Mar" "27Mar" "28Mar" "2Apr" "7Apr")
drop _est_m01 ///_est_m00  _est_m02 
     _est_m11 ///_est_m10  _est_m12 
	 _est_m21 ///_est_m20  _est_m22 
	 _est_m31 ///_est_m30  _est_m32 
	 _est_m41 ///_est_m40 _est_m42 
	 _est_m51 ///_est_m50  _est_m52 
	 _est_m61 ///_est_m60  _est_m62 
	 _est_m71 ///_est_m70  _est_m72 
	 _est_m81 ///_est_m80  _est_m82 
	 _est_m91 ///_est_m90  _est_m92 
	 _est_m101 ///_est_m100  _est_m102 
	 _est_m201 ///_est_m200  _est_m202 
	 _est_m301 ///_est_m300  _est_m302 
	 _est_m401 ///_est_m400  _est_m402 
	 _est_m501 ///_est_m500  _est_m502 
	 _est_m601 ///_est_m600  _est_m602 
	 _est_m701 

	 
*step-8: remove v3 and travel purpose, policies are combined in one model for those adopted on the same day, calcuate margins with countries


xtnbreg v8n  i.v2 i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
/// i.resident i.student i.tourist i.job
i.p311bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx( i.v2 i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.student i.tourist i.job
i.p311bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m01

xtnbreg v8n i.v2  i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 /// v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student  
i.p311bjr i.p313shr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m11


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m21 



xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2 i.v9 i.v12 v14 ///v3 
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m51


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m61


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m71


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr  i.pfl i.p321tj ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m81


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr  i.pfl i.p321tj  i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr  i.pfl i.p321tj i.pfr ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m91

xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr  i.pfl i.p321tj i.pfr i.p325bj  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m101


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh   ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident i.tourist i.job  i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m201




xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh i.p327yn i.p327gd  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh i.p327yn i.p327gd ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m401


xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa   ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 
///i.resident  i.tourist i.job i.student
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.pfr i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m501



xtnbreg v8n i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident   i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe 
margins, dydx(i.v2  i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj  i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m601


xtnbreg v8n  i.v2 i.v9 i.v12 v14 ///v3
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job 
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj  i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48, fe 
margins, dydx(i.v2 i.v9 i.v12 v14 ///v3 
i.v4 v5_1 i.v6 v7 /// v15 i.pfr
///i.resident i.student i.tourist i.job
i.p311bjr i.p313shr i.p316bjr i.p317shr i.p317ynr i.p317xar i.p319gdr i.pfl i.p321tj  i.p325bj i.p326sh i.p327yn i.p327gd i.p328xa i.p402hlj i.p407hlj  ///
          ocountry1  ocountry2  ocountry3  ocountry4  ocountry5  ocountry6  ocountry7  ocountry8  ocountry9  ocountry10  /// 
          ocountry11 ocountry12 ocountry13 ocountry14 ocountry15 ocountry16 ocountry17 ocountry18 ocountry19 ocountry20  ///
          ocountry21 ocountry22 ocountry23 ocountry24 ocountry25 ocountry26 ocountry27 ocountry28 ocountry29 ocountry30  ///
          ocountry31 ocountry32 ocountry33 ocountry34 ocountry35 ocountry36 ocountry37 ocountry38 ocountry39 ocountry40  ///
          ocountry41 ocountry42 ocountry43 ocountry44 ocountry45 ocountry46 ocountry47 ocountry48) atmeans post
estimates store m701

esttab m01 ///m00  m02 
       m11 ///m10  m12 
	   m21 ///m20  m22 
	   m51 ///m50  m52 
	   m61 ///m60  m62 
	   m71 ///m70  m72 
	   m81 ///m80  m82 
	   m91 ///m90  m92 
	   m101 ///m100  m102 
	   m201 ///m200  m202 
	   m401 ///m400  m402 
	   m501 ///m500  m502 
	   m601 ///m600  m602 
	   m701 ///m700  m702 
///using 对比8.csv, replace nogaps wide b(%12.2f) t(2) r2(3) star(* 0.10 ** 0.05 *** 0.01) title("") mtitles("11Mar" "13Mar" "16Mar" "17Mar" "19Mar" "pfl" "21Mar" "pfr" "25Mar" "26Mar" "27Mar" "28Mar" "2Apr" "7Apr")
///using 对比8_ci.csv, ci level(95) replace nogaps wide b(%12.2f) t(2) r2(3) star(* 0.10 ** 0.05 *** 0.01) title("") mtitles("11Mar" "13Mar" "16Mar" "17Mar" "19Mar" "pfl" "21Mar" "pfr" "25Mar" "26Mar" "27Mar" "28Mar" "2Apr" "7Apr")
///using 对比8_p.csv, p level(95) replace nogaps wide b(%12.2f) t(2) r2(3) star(* 0.10 ** 0.05 *** 0.01) title("") mtitles("11Mar" "13Mar" "16Mar" "17Mar" "19Mar" "pfl" "21Mar" "pfr" "25Mar" "26Mar" "27Mar" "28Mar" "2Apr" "7Apr")
using 对比8_se.csv, se level(95) replace nogaps wide b(%12.2f) t(2) r2(3) star(* 0.10 ** 0.05 *** 0.01) title("") mtitles("11Mar" "13Mar" "16Mar" "17Mar" "19Mar" "pfl" "21Mar" "pfr" "25Mar" "26Mar" "27Mar" "28Mar" "2Apr" "7Apr")
drop _est_m01 ///_est_m00  _est_m02 
     _est_m11 ///_est_m10  _est_m12  
	 _est_m21 ///_est_m20  _est_m22 
	 _est_m51 ///_est_m50  _est_m52 
	 _est_m61 ///_est_m60  _est_m62 
	 _est_m71 ///_est_m70  _est_m72 
	 _est_m81 ///_est_m80  _est_m82 
	 _est_m91 ///_est_m90  _est_m92 
	 _est_m101 ///_est_m100  _est_m102 
	 _est_m201 ///_est_m200  _est_m202  
	 _est_m401 ///_est_m400  _est_m402 
	 _est_m501 ///_est_m500  _est_m502 
	 _est_m601 ///_est_m600  _est_m602 
	 _est_m701 
