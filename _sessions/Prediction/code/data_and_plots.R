

college_train = read_csv('1_Data/college_train.csv')
college_test = read_csv('1_Data/college_test.csv')

graduation_train = college_train %>% 
  mutate(Private = case_when(
    Private == 'No' ~ 'Nein',
    TRUE ~ 'Ja'
  )) %>% 
  rename(
    Privatuniversitaet  =  Private,
    Bewerbungen  =  Apps,
    Angenommen  =  Accept,
    Eingeschrieben  =  Enroll,
    Prozent_Top10  =  Top10perc,
    Prozent_Top25  =  Top25perc,
    Vollzeit  =  F.Undergrad,
    Teilzeit  =  P.Undergrad,
    Kosten_ausserhalb  =  Outstate,
    Kosten_Unterkunft  =  Room.Board,
    Kosten_Buecher=  Books,
    Kosten_persoenlich  =  Personal,
    Prozent_PhD  =  PhD,
    Prozent_Degree  =  Terminal,
    Verhaeltnis_Stud.Doz.  =  S.F.Ratio,
    Prozent_Spenden  =  perc.alumni,
    Kosten_Student  =  Expend,
    Abschlussrate  =  Grad.Rate
    ) 


graduation_test = college_test %>% 
  mutate(Private = case_when(
    Private == 'No' ~ 'Nein',
    TRUE ~ 'Ja'
  )) %>% 
  rename(
    Privatuniversitaet  =  Private,
    Bewerbungen  =  Apps,
    Angenommen  =  Accept,
    Eingeschrieben  =  Enroll,
    Prozent_Top10  =  Top10perc,
    Prozent_Top25  =  Top25perc,
    Vollzeit  =  F.Undergrad,
    Teilzeit  =  P.Undergrad,
    Kosten_ausserhalb  =  Outstate,
    Kosten_Unterkunft  =  Room.Board,
    Kosten_Buecher=  Books,
    Kosten_persoenlich  =  Personal,
    Prozent_PhD  =  PhD,
    Prozent_Degree  =  Terminal,
    Verhaeltnis_Stud.Doz.  =  S.F.Ratio,
    Prozent_Spenden  =  perc.alumni,
    Kosten_Student  =  Expend,
    Abschlussrate  =  Grad.Rate
  )

write_csv(graduation_train, '_sessions/Prediction/1_Data/graduation_train.csv')
write_csv(graduation_test, '_sessions/Prediction/1_Data/graduation_test.csv')


