DROP TABLE IF EXISTS positions CASCADE;
\echo '\n Creating positions table:\n'

CREATE TABLE positions (
               position_id SERIAL PRIMARY KEY,
               position_title VARCHAR(100) NOT NULL,
               description TEXT,
               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
               updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS departments CASCADE;
\echo '\n Creating departments table:\n'
CREATE TABLE departments (
                 department_id SERIAL PRIMARY KEY,
                 department_name VARCHAR(100) NOT NULL,
                 description TEXT,
                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS participants CASCADE;
\echo '\n Creating participants table:\n'
CREATE TABLE participants (
                  participant_id SERIAL PRIMARY KEY,
                  first_name VARCHAR(50) NOT NULL,
                  last_name VARCHAR(50) NOT NULL,
                    -- email VARCHAR(100) UNIQUE NOT NULL,
                    -- phone VARCHAR(20),
                  date_of_birth DATE,
                  position_id INTEGER REFERENCES positions(position_id),
                  department_id INTEGER REFERENCES departments(department_id),
                  hired_date DATE,
                  employment_status VARCHAR(20),
                  manager_id INTEGER REFERENCES participants(participant_id),
                  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS assessments CASCADE;
\echo '\n Creating assessments table:\n'
CREATE TABLE assessments (
                  assessment_id SERIAL PRIMARY KEY,
                  assessment_name VARCHAR(200) NOT NULL,
                  last_name VARCHAR(50) NOT NULL,
                  assessment_date DATE,
                  is_finished BOOLEAN DEFAULT false,
                  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS assessment_participants CASCADE;
\echo '\n Creating assessment_participants table:\n'
CREATE TABLE assessment_participants (
                 assessment_participant_id SERIAL PRIMARY KEY,
                 assessment_id INTEGER REFERENCES assessments(assessment_id),
                 participant_id INTEGER REFERENCES participants(participant_id),
                 current_manager_id INTEGER REFERENCES participants(participant_id),
                 current_department INTEGER REFERENCES departments(department_id),
                 current_position   INTEGER REFERENCES positions(position_id),
                 notes TEXT,
                 critical_note TEXT,
                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS skills CASCADE;
\echo '\n Creating skills table:\n'
CREATE TABLE skills (
               skill_id SERIAL PRIMARY KEY,
               skill_name VARCHAR(100) NOT NULL,
               description TEXT,
               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
               updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS pattern_groups CASCADE;
\echo '\n Creating pattern_groups table:\n'
CREATE TABLE pattern_groups (
          pattern_group_id SERIAL PRIMARY KEY,
          skill_id INTEGER REFERENCES  skills(skill_id),
          pattern_group_name VARCHAR(200) NOT NULL,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



DROP TABLE IF EXISTS patterns CASCADE;
\echo '\n Creating patterns table:\n'
CREATE TABLE patterns (
          pattern_id SERIAL PRIMARY KEY,
          pattern_group_id INTEGER REFERENCES pattern_groups(pattern_group_id),
          pattern_name VARCHAR(200) NOT NULL,
          long_name TEXT,
          pattern_mark INTEGER NOT NULL ,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS assessment_skills CASCADE;
\echo '\n Creating assessment_skills table:\n'
CREATE TABLE assessment_skills (
           assessment_id INTEGER,
           skill_id INTEGER,
           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
           PRIMARY KEY (assessment_id, skill_id),
           FOREIGN KEY (assessment_id) REFERENCES assessments(assessment_id),
           FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

DROP TABLE IF EXISTS marks CASCADE;
\echo '\n Creating marks table:\n'
CREATE TABLE marks (
           mark_id SERIAL PRIMARY KEY,
           assessment_participant_id INTEGER REFERENCES assessment_participants(assessment_participant_id),
           pattern_group_id INTEGER REFERENCES pattern_groups(pattern_group_id),
           pattern_id INTEGER REFERENCES patterns(pattern_id),
           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
           UNIQUE (assessment_participant_id, pattern_group_id)
);
