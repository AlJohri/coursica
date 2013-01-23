class CreateSubjects < ActiveRecord::Migration

  def change

    create_table :subjects do |t|
    	t.string "subject", :limit => 10 # 8 is max
    	t.string "title"
    end

		hash_subjects = {
			"ACCOUNT" => "ACCOUNT - Accounting",
			"ACCT" => "ACCT - Accounting & Info Systems",
			"ACCTX" => "ACCTX - Accounting & Info Systems",
			"ADVT" => "ADVT - Advertising",
			"AFST" => "AFST - African Studies",
			"AF_AM_ST" => "AF_AM_ST - African American Studies",
			"ALT_CERT" => "ALT_CERT - Alternative Certification",
			"AMER_ST" => "AMER_ST - American Studies",
			"AMES" => "AMES - Asian & Middle Eastern Studies",
			"ANTHRO" => "ANTHRO - Anthropology",
			"APP_PHYS" => "APP_PHYS - Applied Physics",
			"ARABIC" => "ARABIC - Arabic",
			"ART" => "ART - Art Theory & Practice",
			"ART_HIST" => "ART_HIST - Art History",
			"ASIAN_AM" => "ASIAN_AM - Asian American Studies",
			"ASTRON" => "ASTRON - Astronomy",
			"BIOL_SCI" => "BIOL_SCI - Biological Sciences",
			"BLAW" => "BLAW - Business Law",
			"BMD_ENG" => "BMD_ENG - Biomedical Engineering",
			"BUS_ALYS" => "BUS_ALYS - Business Analyst",
			"BUS_INST" => "BUS_INST - Business Institutions",
			"BUS_LAW" => "BUS_LAW - Business Law",
			"CFS" => "CFS - Chicago Field Studies",
			"CHEM" => "CHEM - Chemistry",
			"CHEM_ENG" => "CHEM_ENG - Chemical Engineering",
			"CHINESE" => "CHINESE - Chinese",
			"CHSS" => "CHSS - Comp & Hist Social Science",
			"CIC" => "CIC - CIC Traveling Scholar",
			"CIS" => "CIS - Computer Information Systems",
			"CIV_ENV" => "CIV_ENV - Civil & Envrnmtl Engineering",
			"CLASSICS" => "CLASSICS - Classics - Readings in Englis",
			"CLIN_PSY" => "CLIN_PSY - Clinical Psychology",
			"CLIN_RES" => "CLIN_RES - Clinical Research & Reg Admin",
			"CME" => "CME - Chicago Metropolitan Exchange",
			"CMN" => "CMN - Communication Related Courses",
			"COG_SCI" => "COG_SCI - Cognitive Science",
			"COMM_ST" => "COMM_ST - Communication Studies",
			"COMP_LIT" => "COMP_LIT - Comparative Literary Studies",
			"CONDUCT" => "CONDUCT - Conducting",
			"COUN_PSY" => "COUN_PSY - Counseling Psychology",
			"CRDV" => "CRDV - Career Development",
			"CSD" => "CSD - Comm Sci & Disorders",
			"DANCE" => "DANCE - Dance",
			"DECS" => "DECS - Mngrl Econ & Decision Sci",
			"DECSX" => "DECSX - Mngrl Econ & Decision Sci",
			"DIV_MED" => "DIV_MED - Divorce Mediation Training",
			"DSGN" => "DSGN - Segal Design Institute",
			"EARTH" => "EARTH - Earth and Planetary Sciences",
			"ECON" => "ECON - Economics",
			"EECS" => "EECS - Elect Engineering & Comp Sci",
			"ENGLISH" => "ENGLISH - English",
			"ENTR" => "ENTR - Entrepreneurship",
			"ENVR_POL" => "ENVR_POL - Environmental Policy & Culture",
			"ENVR_SCI" => "ENVR_SCI - Environmental Science",
			"EPI_BIO" => "EPI_BIO - Epidemiology & Biostats",
			"ES_APPM" => "ES_APPM - Engineering Sci & Applied Mat",
			"EXMMX" => "EXMMX - Executive Master in Management",
			"FINANCE" => "FINANCE - Finance",
			"FINC" => "FINC - Finance",
			"FINCX" => "FINCX - Finance",
			"FN_EXTND" => "FN_EXTND - CFP Extended",
			"FRENCH" => "FRENCH - French",
			"GBL_HLTH" => "GBL_HLTH - Global Health",
			"GENET_CN" => "GENET_CN - Genetic Counseling",
			"GEN_CMN" => "GEN_CMN - General Comm & Intro Courses",
			"GEN_ENG" => "GEN_ENG - General Engineering",
			"GEN_LA" => "GEN_LA - General Liberal Arts",
			"GEN_MUS" => "GEN_MUS - General Music",
			"GEOG" => "GEOG - Geography",
			"GERMAN" => "GERMAN - German",
			"GNDR_ST" => "GNDR_ST - Gender Studies",
			"GREEK" => "GREEK - Greek",
			"HDPS" => "HDPS - Human Develop & Psych Svcs",
			"HDSP" => "HDSP - Human Development & Social Pol",
			"HEBREW" => "HEBREW - Hebrew",
			"HEMA" => "HEMA - Health Enterprise Management",
			"HINDI" => "HINDI - Hindi",
			"HISTORY" => "HISTORY - History",
			"HQS" => "HQS - Hlthcare Quality & Pat Safety",
			"HSR" => "HSR - Health Services Research",
			"HUM" => "HUM - Humanities",
			"IBIS" => "IBIS - Interdepartmental Bio Sciences",
			"IEMS" => "IEMS - Indust Eng & Mgmt Sciences",
			"IGP" => "IGP - Integ Life Sciences",
			"IMC" => "IMC - Integ Marketing Communication",
			"INF_TECH" => "INF_TECH - Information Technology",
			"INTG_SCI" => "INTG_SCI - Integrated Science",
			"INTL" => "INTL - International Business",
			"INTLX" => "INTLX - International Business",
			"INTL_ST" => "INTL_ST - International Studies",
			"IPLS" => "IPLS - Liberal Studies",
			"ISEN" => "ISEN - Initiative Sustain & Energy",
			"ITALIAN" => "ITALIAN - Italian",
			"JAPANESE" => "JAPANESE - Japanese",
			"JAZZ_ST" => "JAZZ_ST - Jazz Studies",
			"JOUR" => "JOUR - Journalism",
			"JRN_WRIT" => "JRN_WRIT - Journalistic Writing",
			"JWSH_ST" => "JWSH_ST - Jewish Studies",
			"JW_LEAD" => "JW_LEAD - Jewish Leadership",
			"KELLG_FE" => "KELLG_FE - Financial Economics",
			"KELLG_MA" => "KELLG_MA - Managerial Analytics",
			"KOREAN" => "KOREAN - Korean",
			"LATIN" => "LATIN - Latin",
			"LATINO" => "LATINO - Latina and Latino Studies",
			"LAWSTUDY" => "LAWSTUDY - Law Studies",
			"LDRSHP" => "LDRSHP - Leadership",
			"LEADERS" => "LEADERS - Leadership",
			"LEAD_ART" => "LEAD_ART - Art of Leadership",
			"LEGAL_ST" => "LEGAL_ST - Legal Studies",
			"LING" => "LING - Linguistics",
			"LIT" => "LIT - Literature",
			"LITARB" => "LITARB - Litigation and Arbitration",
			"LOC" => "LOC - Learning & Org Change",
			"LRN_SCI" => "LRN_SCI - Learning Sciences",
			"MATH" => "MATH - Mathematics",
			"MAT_SCI" => "MAT_SCI - Materials Science & Eng",
			"MBIOTECH" => "MBIOTECH - Masters in Biotechnology",
			"MCW" => "MCW - Master of Creative Writing",
			"MDVL_ST" => "MDVL_ST - Medieval Studies",
			"MECH_ENG" => "MECH_ENG - Mechanical Engineering",
			"MECN" => "MECN - Decision Sciences",
			"MECNX" => "MECNX - Decision Sciences",
			"MECS" => "MECS - Managerial Econ & Strategy",
			"MECSX" => "MECSX - Managerial Econ & Strategy",
			"MEDM" => "MEDM - Media Management",
			"MED_INF" => "MED_INF - Medical Informatics",
			"MED_SKIL" => "MED_SKIL - Mediation Skills Training",
			"MGMT" => "MGMT - Management",
			"MGMTX" => "MGMTX - Management",
			"MHB" => "MHB - Medical Humanities & Bioethics",
			"MKTG" => "MKTG - Marketing",
			"MKTGX" => "MKTGX - Marketing",
			"MMSS" => "MMSS - Math Methods in the Social Sc",
			"MORS" => "MORS - Management and Organizations",
			"MORSX" => "MORSX - Management and Organizations",
			"MPD" => "MPD - Master of Product Development",
			"MPPA" => "MPPA - Master of Public Policy Admin",
			"MSA" => "MSA - Sports Administration",
			"MSC" => "MSC - MS in Communication",
			"MSCI" => "MSCI - Master of Science in Clin Inv",
			"MSIA" => "MSIA - Master of Science in Analytics",
			"MSRC" => "MSRC - Master of Regulatory Complianc",
			"MSTP" => "MSTP - Medical Scientist Training",
			"MS_ED" => "MS_ED - MS in Educ & Social Policy",
			"MS_FT" => "MS_FT - MS in Marital & Family Therapy",
			"MS_HE" => "MS_HE - MS in Higher Ed Admin & Policy",
			"MS_LOC" => "MS_LOC - Learning & Org Change",
			"MTS" => "MTS - Media, Technology & Society",
			"MUSEUM" => "MUSEUM - Museum Studies",
			"MUSIC" => "MUSIC - Music",
			"MUSICOL" => "MUSICOL - Musicology",
			"MUSIC_ED" => "MUSIC_ED - Music Education",
			"MUS_COMP" => "MUS_COMP - Music Composition",
			"MUS_HIST" => "MUS_HIST - Music History & Lit",
			"MUS_TECH" => "MUS_TECH - Music Technology",
			"MUS_THRY" => "MUS_THRY - Music Theory",
			"NAV_SCI" => "NAV_SCI - Naval Science",
			"NEUROBIO" => "NEUROBIO - Neurobiology & Physiology",
			"NUIN" => "NUIN - Neuroscience",
			"OPNS" => "OPNS - Operations Management",
			"OPNSX" => "OPNSX - Operations Management",
			"ORG_BEH" => "ORG_BEH - Organizational Behavior",
			"ORTH" => "ORTH - Orthotics",
			"PBC" => "PBC - Plant Biology & Conservation",
			"PERF_ST" => "PERF_ST - Performance Studies",
			"PERSIAN" => "PERSIAN - Persian",
			"PHIL" => "PHIL - Philosophy",
			"PHIL_NP" => "PHIL_NP - Philanthropy & Nonprofit Fund",
			"PHYSICS" => "PHYSICS - Physics",
			"PHYS_TH" => "PHYS_TH - Physical Therapy",
			"PIANO" => "PIANO - Piano",
			"POLI_SCI" => "POLI_SCI - Political Science",
			"PORT" => "PORT - Portuguese",
			"PREDICT" => "PREDICT - Predictive Analytics",
			"PROJ_MGT" => "PROJ_MGT - Project Management",
			"PROJ_PMI" => "PROJ_PMI - Project Management",
			"PROS" => "PROS - Prosthetics",
			"PSYCH" => "PSYCH - Psychology",
			"PUB_HLTH" => "PUB_HLTH - Master's in Public Health",
			"QARS" => "QARS - Qual Assur & Reg Science",
			"REAL" => "REAL - Real Estate",
			"RELIGION" => "RELIGION - Religious Studies",
			"RTVF" => "RTVF - Radio/Television/Film",
			"SCS" => "SCS - School of Continuing Studies",
			"SEEK" => "SEEK - Social Enterprise",
			"SESP" => "SESP - SESP Core",
			"SHC" => "SHC - Science in Human Culture",
			"SLAVIC" => "SLAVIC - Slavic Languages & Literature",
			"SOCIOL" => "SOCIOL - Sociology",
			"SOC_POL" => "SOC_POL - Social Policy",
			"SPANISH" => "SPANISH - Spanish",
			"SPANPORT" => "SPANPORT - Spanish and Portuguese",
			"STAT" => "STAT - Statistics",
			"STRINGS" => "STRINGS - String Instruments",
			"SWAHILI" => "SWAHILI - Swahili",
			"TEACH_ED" => "TEACH_ED - Teacher Education",
			"TGS" => "TGS - TGS General Registrations",
			"TH&DRAMA" => "TH&DRAMA - Theatre & Drama",
			"THEATRE" => "THEATRE - Theatre",
			"TURKISH" => "TURKISH - Turkish",
			"URBAN_ST" => "URBAN_ST - Urban Studies",
			"VOICE" => "VOICE - Voice & Opera",
			"WIND_PER" => "WIND_PER - Wind & Percussion",
			"WRITING" => "WRITING - Writing Arts",
		}    

    hash_subjects.each { |key, value|
    	Subject.create :subject => key, :title => value
    }

  end

end