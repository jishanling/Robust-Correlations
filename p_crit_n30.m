function [crit_p_value, adj_p_value] = p_crit_n30(alphav, p_obs)
% MATLAB implimentation of p.crit.n30 from Rand Wilcox's 
% robust statistics functions. 

% requires: 
%  https://github.com/CPernet/Robust_Statistical_Toolbox/blob/master/stats_functions/low_level_stats_functions/rst_hd.m)

p_table = [...
0.696	0.828	0.208	0.328	0.152
0.632	0.184	0.452	0.86	0.988
0.772	0.832	0.288	0.288	0.944
0.672	0.868	0.476	0.148	0.292
0.792	0.852	0.236	0.9	    1
0.484	0.932	0.704	0.4	    0.904
0.656	0.32	0.104	0.676	0.572
0.936	0.14	0.148	0.86	0.508
0.748	0.328	0.816	0.268	0.364
0.152	0.816	0.5	    0.972	0.684
0.156	0.676	0.244	0.948	0.612
0.28	0.092	0.712	0.152	0.704
0.192	0.904	0.372	0.908	0.992
0.692	0.956	0.704	0.964	0.484
0.496	0.768	0.172	0.336	0.108
0.052	0.62	0.192	0.664	0.716
0.148	0.6	    0.384	0.52	0.536
0.992	0.272	0.68	0.232	0.368
0.788	0.572	0.516	0.476	0.832
0.988	0.72	0.432	0.756	0.564
0.792	0.44	0.996	0.388	0.456
0.848	0.364	1	    0.584	0.104
0.68	0.848	0.268	0.424	0.836
0.316	0.828	0.12	0.392	0.588
0.38	0.544	0.108	0.248	0.972
0.94	0.184	0.156	0.444	0.28
0.612	0.22	0.544	0.888	0.808
0.436	0.736	0.424	0.792	0.324
0.672	0.012	0.36	0.656	0.54
0.872	0.596	0.788	0.896	0.532
0.34	0.664	0.28	0.484	0.888
0.66	0.824	0.032	0.524	0.496
0.84	0.564	0.432	0.668	0.664
0.332	0.576	0.568	0.388	0.876
0.06	0.948	0.664	0.764	0.12
0.416	0.956	0.936	0.848	0.904
0.596	0.792	0.232	0.68	0.404
0.556	0.356	0.44	0.936	0.748
0.968	0.528	0.8	    0.152	0.68
0.792	0.664	0.872	0.856	0.176
0.908	0.124	0.744	0.708	0.632
0.68	0.972	0.244	0.984	0.76
0.828	0.256	0.888	0.688	0.312
0.828	0.124	0.296	0.396	0.8
0.756	0.104	0.228	0.884	0.948
0.96	0.52	0.724	0.824	0.436
0.672	0.868	0.772	0.612	0.48
0.036	0.868	0.52	0.268	0.232
0.608	0.676	0.476	0.588	0.904
0.508	0.236	0.952	0.848	0.628
0.924	0.132	0.812	0.696	0.3
0.948	0.904	0.868	0.392	0.072
0.38	0.624	0.608	0.756	0.332
0.088	0.42	0.764	0.648	0.084
0.428	0.04	0.408	0.548	0.216
0.636	0.784	0.24	0.9	    0.512
0.476	0.504	0.288	0.812	0.6
0.696	0.492	0.42	0.068	0.236
0.604	0.564	0.888	0.816	0.52
0.092	0.096	0.372	0.54	0.328
0.96	0.276	0.38	0.1	    0.412
0.732	0.184	0.044	0.772	0.892
0.244	0.344	0.976	0.04	0.088
0.032	0.796	0.24	0.524	0.808
0.472	0.472	0.152	0.696	0.728
0.756	0.784	0.452	0.764	0.764
0.144	0.988	0.552	0.788	0.5
0.46	0.42	0.468	0.516	0.832
0.528	0.724	0.148	0.648	0.456
0.28	0.804	0.496	0.464	0.52
0.864	0.228	0.544	0.708	0.912
0.528	0.18	0.188	0.092	0.44
0.452	0.596	0.424	0.32	0.808
0.036	0.508	0.836	0.064	0.924
0.4  	0.324	0.464	0.888	0.948
0.688	0.856	0.76	0.16	0.44
0.372	0.328	0.088	0.984	0.496
0.428	0.892	0.636	0.236	0.704
0.704	0.416	0.9	    0.716	0.976
0.908	0.524	0.604	0.436	0.332
0.996	0.428	1	    0.244	0.712
0.456	0.808	0.984	0.804	0.62
0.552	0.732	0.264	0.488	0.604
0.424	0.936	0.808	0.356	0.164
0.152	0.34	0.34	0.644	0.4
0.784	0.308	0.296	0.672	0.664
0.64	0.76	0.24	0.464	0.656
0.84	0.76	0.176	0.148	0.184
0.296	0.516	0.62	0.396	0.384
0.84	0.984	0.964	0.46	0.224
0.968	0.292	0.78	0.696	0.128
0.384	0.98	0.852	0.408	0.644
0.744	0.876	0.688	0.924	0.06
0.36	0.4     0.528	0.084	0.216
0.4     0.984	0.488	0.152	0.608
0.332	0.5     0.884	0.78	0.912
0.236	0.368	0.276	0.74	0.96
0.912	0.36	0.608	0.804	0.9
0.688	0.348	0.748	0.544	0.956
0.384	0.892	0.728	0.164	0.392
0.876	0.836	0.54	0.604	0.456
0.144	0.3     0.848	0.272	0.668
0.908	0.004	0.812	0.408	0.676
0.928	0.224	0.052	0.756	0.928
0.428	0.096	0.996	0.996	0.828
0.504	0.616	0.788	0.644	0.26
0.764	0.616	0.248	0.556	0.972
0.912	0.66	0.72	0.792	0.204
0.904	0.32	0.228	0.628	0.912
0.804	0.072	0.656	0.456	0.992
0.3     0.808	0.692	0.84	0.544
0.072	0.652	0.524	0.884	0.168
0.208	0.216	0.948	0.896	0.92
0.964	0.784	0.812	0.708	0.936
0.508	0.488	0.156	0.94	0.088
0.508	0.72	0.636	0.552	0.016
0.464	0.348	0.576	0.904	0.248
0.324	0.516	0.988	0.616	0.716
0.664	0.576	0.336	0.792	0.824
0.896	0.804	0.524	0.332	0.804
0.94	0.424	0.964	0.644	0.604
0.4     0.984	0.38	0.696	0.248
0.244	0.772	0.836	0.048	0.696
0.724	0.576	0.6     0.348	0.88
0.776	0.376	0.644	0.648	0.08
0.424	0.912	0.964	0.224	0.984
0.476	0.928	0.64	0.944	0.512
0.644	0.596	0.388	0.28	0.124
0.212	0.388	0.416	0.884	0.964
0.996	0.428	0.832	0.464	0.88
0.984	0.256	0.664	0.344	0.496
0.192	0.124	0.392	0.268	0.4
0.944	0.816	0.648	0.252	0.16
0.24	0.716	0.272	0.136	0.832
0.212	0.548	0.776	0.328	0.492
0.952	0.62	0.688	0.26	0.084
0.264	0.856	0.912	0.796	0.78
0.276	0.692	0.628	0.26	0.592
0.66	0.66	0.912	0.84	0.244
0.66	0.892	0.332	0.092	0.584
0.804	0.408	0.036	0.22	0.02
0.648	0.52	0.212	0.34	0.4
0.38	0.156	0.464	0.32	0.944
0.84	0.98	0.676	0.396	0.86
0.884	0.272	0.712	0.444	0.24
0.296	0.956	0.436	0.096	0.448
0.796	0.084	0.872	0.368	0.828
0.656	0.192	0.984	0.668	0.452
0.992	0.904	0.572	0.768	0.42
0.444	0.42	0       0.456	0.464
0.908	0.884	0.704	0.164	0.604
0.924	0.748	0.688	0.648	0.968
0.332	0.636	0.472	0.956	0.924
0.6     0.788	0.488	0.156	0.904
0.892	0.372	0.948	0.868	0.06
0.58	0.604	0.9     0.212	0.824
0.632	0.416	0.5     0.576	0.932
0.472	0.932	0.936	0.96	0.26
0.556	0.372	0.748	0.368	0.256
0.076	0.676	0.292	0.504	0.6
0.216	0.796	0.488	0.132	0.076
0.02	0.48	0.848	0.772	0.524
0.22	0.908	0.432	0.952	0.556
0.12	0.868	0.756	0.732	0.56
0.084	0.7     0.34	0.2	0.704
0.336	0.092	0.22	0.944	0.044
0.844	0.356	0.72	0.276	0.664
0.828	0.492	0.392	0.368	0.32
0.304	0.804	0.856	0.528	0.6
0.056	0.908	0.124	0.448	0.632
0.232	0.008	0.2     0.552	0.884
0.82	0.92	0.744	0.26	0.492
0.94	0.96	0.572	0.536	0.196
0.992	0.524	0.356	0.116	0.072
0.084	0.46	0.604	0.884	0.752
0.812	0.36	0.492	0.508	0.42
0.54	0.132	0.084	0.328	0.984
0.104	0.592	0.172	0.992	0.688
0.572	0.312	0.304	0.596	0.796
0.488	0.388	0.188	0.456	0.716
0.168	0.292	0.36	0.848	0.02
0.756	0.6     0.956	0.676	0.864
0.96	0.304	0.276	0.576	0.32
0.324	0.776	0.66	0.652	0.832
0.052	0.24	0.08	0.844	0.668
0.44	0.844	0.476	0.224	0.604
0.876	0.436	0.8     0.228	0.364
0.792	0.052	0.94	0.444	0.796
0.436	0.276	0.908	0.092	0.74
0.128	0.76	0.256	0.56	0.376
0.604	0.82	0.864	0.328	0.24
0.244	0.28	0.648	0.452	0.56
0.712	0.14	0.908	0.256	0.544
0.176	0.36	0.924	0.584	0.216
0.68	0.82	0.628	0.828	0.316
0.52	0.34	0.172	0.916	0.54
0.88	0.636	0.796	0.696	0.976
0.68	0.368	0.456	0.764	0.736
0.356	0.188	0.992	0.94	0.572
0.112	0.736	0.476	0.58	0.772
0.944	0.348	0.248	0.292	0.992
0.916	0.128	0.904	0.804	0.66
0.972	0.044	0.228	0.82	0.296
0.92	0.368	0.924	0.96	0.928
0.38	0.184	0.86	0.8	    0.136
0.304	0.512	0.684	0.612	0.624
0.868	0.908	0.548	0.396	0.436
0.668	0.92	0.196	0.156	0.176
0.088	0.888	0.524	0.196	0.736
0.736	0.884	0.072	0.824	0.456
0.404	0.212	0.664	0.404	0.608
0.532	0.62	0.816	0.496	0.836
0.328	0.868	0.48	0.636	0.836
0.668	0.424	0.364	0.276	0.376
0.744	0.228	0.604	0.656	0.936
0.344	0.54	0.868	0.876	0.184
0.204	0.976	0.752	0.796	0.324
0.88	0.108	0.552	0.92	0.132
0.44	0.312	0.184	0.936	0.44
0.62	0.492	0.976	0.764	0.94
0.48	0.908	0.888	0.332	0.74
0.532	0.64	0.976	0.668	0.992
0.988	0.892	0.516	0.496	0.56
0.016	0.616	0.224	0.3	    0.684
0.616	0.452	0.976	0.248	0.132
0.256	0.136	0.956	0.144	0.96
0.664	0.26	0.772	0.108	0.868
0.516	0.268	0.376	0.532	0.68
0.56	0.428	0.64	0.272	0.808
0.22	0.156	0.184	0.436	0.452
0.128	0.924	0.488	0.268	0.584
0.596	0.892	0.284	0.916	0.424
0.576	0.844	0.212	0.696	0.2
0.88	0.548	0.728	0.88	0.72
0.468	0.208	0.524	0.896	0.06
0.516	0.736	0.508	0.524	0.9
0.408	0.82	0.68	0.16	0.776
0.84	0.756	0.236	0.8	    0.84
0.548	0.628	0.54	0.768	0.328
0.476	0.604	0.22	0.844	0.396
0.704	0.556	0.128	0.068	0.08
0.424	0.544	0.556	0.464	0.74
0.716	0.752	0.068	0.804	0.024
0.632	0.68	0.868	0.328	0.448
0.14	0.364	0.596	0.916	0.148
0.504	0.62	0.3     0.536	0.024
0.892	0.932	0.056	0.532	0.084
0.248	0.268	0.944	0.212	0.92
0.5	0.1	0.736	0.648	0.648
0.236	0.604	0.588	0.416	0.88
0.92	0.956	0.6     0.988	0.848
0.54	0.384	0.868	0.748	0.256
0.18	0.196	0.988	0.588	0.94
0.856	0.856	0.512	0.008	0.748
0.46	0.672	0.848	0.932	0.14
0.708	0.812	0.608	0.692	0.756
0.424	0.84	0.16	0.744	0.92
0.892	0.676	0.68	0.164	0.796
0.656	0.496	0.576	0.44	0.088
0.232	0.592	0.04	0.808	0.632
0.86	0.112	0.392	0.196	0.696
0.912	0.872	0.72	0.484	0.348
0.424	0.556	0.408	0.612	0.592
0.636	0.584	0.088	0.28	0.444
0.332	0.444	0.952	0.172	0.664
0.008	0.468	0.624	0.7     0.3
0.356	0.516	0.308	0.964	0.38
0.984	0.956	0.96	0.604	0.044
0.436	0.956	0.192	0.24	0.164
0.888	0.904	0.98	0.924	0.584
0.22	0.988	0.644	0.644	0.652
0.712	0.676	0.136	0.144	0.656
0.548	0.836	0.804	0.856	0.492
0.86	0.744	0.808	0.404	0.62
0.772	0.852	0.712	0.44	0.5
0.768	0.728	0.276	0.776	0.316
0.396	0.656	0.676	0.764	0.4
0.988	0.276	0.952	0.32	0.552
0.976	0.244	0.676	0.916	0.204
0.152	0.548	0.708	0.764	0.524
0.564	0.244	0.656	0.928	0.068
0.984	0.524	0.9     0.792	0.636
0.488	0.56	0.352	0.452	0.328
0.504	0.348	0.804	0.272	0.348
0.6     0.972	0.816	0.208	0.28
0.652	0.944	0.468	0.1	0.676
0.7     0.664	0.948	0.688	0.112
0.816	0.088	0.572	0.236	0.912
0.408	0.752	0.532	0.84	0.464
0.292	0.052	0.088	0.784	0.396
0.592	0.652	0.3     0.24	0.588
0.936	0.084	0.696	0.74	0.516
0.952	0.684	0.564	0.636	0.968
0.184	0.3     0.256	0.804	0.64
0.256	0.844	0.8     0.992	0.66
0.492	0.428	0.94	0.064	0.748
0.424	0.212	0.092	0.076	0.144
0.776	0.228	0.48	0.596	0.324
0.348	0.804	0.812	0.944	0.976
0.864	0.956	0.996	0.54	0.736
0.408	0.172	0.732	0.876	0.564
0.028	0.2     0.444	0.612	0.252
0.584	0.208	0.992	0.32	0.684
0.144	0.38	0.852	0.084	0.292
0.576	0.504	0.532	0.788	0.768
0.664	0.86	0.728	0.556	0.664
0.28	0.588	0.48	0.616	0.576
0.796	0.412	0.596	0.216	0.972
0.952	0.572	0.836	0.772	0.672
0.176	0.96	0.892	0.04	0.416
0.808	0.78	0.68	0.896	0.424
0.404	0.556	0.824	0.004	0.816
0.632	0.06	0.708	0.352	0.136
0.416	0.78	0.94	0.872	0.128
0.072	0.74	0.96	0.308	0.472
0.252	0.112	0.376	0.816	0.408
0.332	0.964	0.364	0.624	0.728
0.764	0.088	0.024	0.052	0.032
0.348	0.388	0.672	0.816	0.188
0.064	0.62	0.744	0.408	0.572
0.672	0.06	0.38	0.92	0.676
0.848	0.756	0.504	0.92	0.092
0.532	0.928	0.076	0.552	0.572
0.28	0.916	0.788	0.312	0.868
0.536	0.448	0.724	0.032	0.38
0.828	0.836	0.328	0.18	0.544
0.228	0.352	0.572	0.4     0.872
0.5     0.36	0.48	0.324	0.656
0.96	0.484	0.152	0.744	0.804
0.908	0.844	0.216	0.968	0.784
0.476	0.84	0.384	0.26	0.576
0.444	0.472	0.636	0.272	0.8
0.476	0.512	0.54	0.512	0.96
0.272	0.764	0.324	0.952	0.604
0.568	0.764	0.912	0.652	0.988
0.192	0.408	0.684	0.208	0.164
0.16	0.36	0.22	0.512	0.636
0.372	0.376	0.548	0.636	0.824
0.132	0.308	0.72	0.916	0.688
0.556	0.556	0.608	0.708	0.22
0.308	0.272	0.612	0.936	0.5
0.608	0.956	0.76	0.832	0.668
0.776	0.852	0.728	0.812	0.892
0.408	0.96	0.708	0.744	0.408
0.832	0.556	0.764	0.116	0.896
0.052	0.452	0.9     0.232	0.484
0.776	0.672	0.536	0.252	0.504
0.044	0.584	0.908	0.96	0.932
0.24	0.824	0.84	0.672	0.856
0.116	0.104	0.912	0.648	0.852
0.644	0.612	0.82	0.408	0.86
0.724	0.684	0.68	0.516	0.78
0.632	0.432	0.98	0.956	0.216
0.228	0.576	0.304	0.4     0.448
0.616	0.292	0.412	0.572	0.136
0.568	0.488	0.228	0.46	0.5
0.452	0.804	0.596	0.076	0.22
0.92	0.868	0.492	0.428	0.524
0.424	0.212	0.512	0.592	0.604
0.784	0.688	0.48	0.588	0.564
0.052	0.484	0.176	0.932	0.196
0.968	0.744	0.9     0.648	0.832
0.836	0.22	0.632	0.804	0.436
0.184	0.588	0.864	0.884	0.82
0.696	0.58	0.768	0.584	0.148
0.66	0.696	0.268	0.04	0.716
0.116	0.536	0.988	0.704	0.612
0.872	0.052	0.352	0.624	0.624
0.332	0.044	0.8     0.476	0.992
0.788	0.872	0.276	0.208	0.632
0.804	0.644	0.4     0.868	0.708
0.636	0.088	0.036	0.936	0.04
0.804	0.532	0.396	0.284	0.652
0.928	0.768	0.82	0.668	0.408
0.944	0.972	0.84	0.608	0.652
0.304	0.316	0.728	0.968	0.804
0.284	0.644	0.244	0.532	0.076
0.748	0.048	0.384	0.424	0.752
0.748	0.984	0.148	0.58	0.58
0.28	0.248	0.7     0.572	0.648
0.632	0.276	0.888	0.932	0.572
0.308	0.072	0.5     0.392	0.068
0.468	0.856	0.232	0.268	1
0.164	0.484	0.032	0.852	0.86
0.912	0.272	0.724	0.536	0.304
0.456	0.752	0.344	0.18	0.968
0.676	0.204	0.664	0.948	0.504
0.696	0.468	0.508	0.324	0.292
0.364	0.476	0.152	0.272	0.948
0.684	0.352	0.26	0.836	0.084
0.912	0.876	0.944	0.164	0.504
0.704	0.604	0.216	0.248	0.536
0.112	0.48	0.976	0.94	0.648
0.764	0.664	0.54	0.012	0.424
0.02	0.48	0.512	0.02	0.436
0.42	0.072	0.54	0.76	0.576
0.192	0.096	0.436	0.58	0.86
0.196	0.368	0.984	0.552	0.632
0.72	0.644	0.952	0.228	0.056
0.376	0.368	0.04	0.316	0.464];
p_table = reshape(p_table, [1, numel(p_table)]);  % vectorize p_table
cp = rst_hd(p_table, alphav);  % Harrell-Davis estimate of the alphav decile

% hdpv function from Wilcox's robust statistics functions
hdpv  = @(val, dat, obs) abs(rst_hd(dat, val)-obs);
[w,t] = fminbnd(@(t)hdpv(t, p_table, p_obs), 0.001, 0.999); % compute minimum of hpdv across 0.001 - 0.999

% output
crit_p_value = cp;
adj_p_value = w;





