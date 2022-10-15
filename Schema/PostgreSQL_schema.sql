-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/O5C8Ex

CREATE TABLE "circuits" (
    "circuitId" int   NOT NULL,
    "circuitRef" varchar(255)   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "location" varchar(255)   NULL,
    "country" varchar(255)   NULL,
    "lat" float   NULL,
    "lng" float   NULL,
    "alt" int   NULL,
    "url" varchar(255)   NOT NULL,
    CONSTRAINT "pk_circuits" PRIMARY KEY (
        "circuitId"
     ),
    CONSTRAINT "uc_circuits_url" UNIQUE (
        "url"
    )
);

CREATE TABLE "constructorResults" (
    "constructorResultsID" int   NOT NULL,
    "raceId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "points" float   NULL,
    "status" varchar(255)   NULL,
    CONSTRAINT "pk_constructorResults" PRIMARY KEY (
        "constructorResultsID"
     )
);

CREATE TABLE "constructorStandings" (
    "constructorStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "points" float   NOT NULL,
    "position" int   NULL,
    "positionText" varchar(255)   NULL,
    "wins" int   NOT NULL,
    CONSTRAINT "pk_constructorStandings" PRIMARY KEY (
        "constructorStandingsId"
     )
);

CREATE TABLE "constructors" (
    "constructorId" int   NOT NULL,
    "constructorRef" varchar(255)   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "nationality" varchar(255)   NULL,
    "url" varchar(255)   NOT NULL,
    CONSTRAINT "pk_constructors" PRIMARY KEY (
        "constructorId"
     ),
    CONSTRAINT "uc_constructors_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "driverStandings" (
    "driverStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "points" float   NOT NULL,
    "position" int   NULL,
    "positionText" varchar(255)   NULL,
    "wins" int   NOT NULL,
    CONSTRAINT "pk_driverStandings" PRIMARY KEY (
        "driverStandingsId"
     )
);

CREATE TABLE "drivers" (
    "driverId" int   NOT NULL,
    "driverRef" varchar(255)   NOT NULL,
    "number" int   NULL,
    "code" varchar(3)   NULL,
    "forename" varchar(255)   NOT NULL,
    "surname" varchar(255)   NOT NULL,
    "dob" date   NULL,
    "nationality" varchar(255)   NULL,
    "url" varchar(255)   NOT NULL,
    CONSTRAINT "pk_drivers" PRIMARY KEY (
        "driverId"
     ),
    CONSTRAINT "uc_drivers_url" UNIQUE (
        "url"
    )
);

CREATE TABLE "lapTimes" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "lap" int   NOT NULL,
    "position" int   NULL,
    "time" varchar(255)   NULL,
    "milliseconds" int   NULL,
    CONSTRAINT "pk_lapTimes" PRIMARY KEY (
        "raceId","driverId","lap"
     )
);

CREATE TABLE "pitStops" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "stop" int   NOT NULL,
    "lap" int   NOT NULL,
    "time" time   NOT NULL,
    "duration" varchar(255)   NULL,
    "milliseconds" int   NULL,
    CONSTRAINT "pk_pitStops" PRIMARY KEY (
        "raceId","driverId","stop"
     )
);

CREATE TABLE "qualifying" (
    "qualifyId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NOT NULL,
    "position" int   NULL,
    "q1" varchar(255)   NULL,
    "q2" varchar(255)   NULL,
    "q3" varchar(255)   NULL,
    CONSTRAINT "pk_qualifying" PRIMARY KEY (
        "qualifyId"
     )
);

CREATE TABLE "races" (
    "raceId" int   NOT NULL,
    "year" int   NOT NULL,
    "round" int   NOT NULL,
    "circuitId" int   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "date" date   NOT NULL,
    "time" time   NULL,
    "url" varchar(255)   NULL,
    "fp1_date" date   NULL,
    "fp1_time" time   NULL,
    "fp2_date" date   NULL,
    "fp2_time" time   NULL,
    "fp3_date" date   NULL,
    "fp3_time" time   NULL,
    "quali_date" date   NULL,
    "quali_time" time   NULL,
    "sprint_date" date   NULL,
    "sprint_time" time   NULL,
    CONSTRAINT "pk_races" PRIMARY KEY (
        "raceId"
     ),
    CONSTRAINT "uc_races_url" UNIQUE (
        "url"
    )
);

CREATE TABLE "results" (
    "resultId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NULL,
    "grid" int   NOT NULL,
    "position" int   NULL,
    "positionText" varchar(255)   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" float   NOT NULL,
    "laps" int   NOT NULL,
    "time" varchar(255)   NULL,
    "milliseconds" int   NULL,
    "fastestLap" int   NULL,
    "rank" int   NULL,
    "fastestLapTime" varchar(255)   NULL,
    "fastedLapSpeed" varchar(255)   NULL,
    "statusId" int   NOT NULL,
    CONSTRAINT "pk_results" PRIMARY KEY (
        "resultId"
    )
);

CREATE TABLE "sprint_results" (
    "sprintResultId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NULL,
    "grid" int   NOT NULL,
    "position" int   NULL,
    "positionText" varchar(255)   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" float   NOT NULL,
    "laps" int   NOT NULL,
    "time" varchar(255)   NULL,
    "milliseconds" int   NULL,
    "fastestLap" int   NULL,
    "fastestLapTime" varchar(255)   NULL,
    "statusId" int   NOT NULL,
    CONSTRAINT "pk_sprint_results" PRIMARY KEY (
        "sprintResultId"
    )
);

CREATE TABLE "seasons" (
    "year" int   NOT NULL,
    "url" varchar(255) NOT NULL,
    CONSTRAINT "pk_seaons" PRIMARY KEY (
        "year"
    ),
    CONSTRAINT "uc_seasons_url" UNIQUE (
        "url"
    )
);

CREATE TABLE "status" (
    "statusId" int   NOT NULL,
    "status" varchar(255)   NOT NULL,
    CONSTRAINT "pk_status" PRIMARY KEY (
        "statusId"
    )
);

ALTER TABLE "constructorResults" ADD CONSTRAINT "fk_constructorResults_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "constructorResults" ADD CONSTRAINT "fk_constructorResults_constructorId" FOREIGN KEY("constructorId")
REFERENCES "constructors" ("constructorId");

ALTER TABLE "constructorStandings" ADD CONSTRAINT "fk_constructorStandings_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "constructorStandings" ADD CONSTRAINT "fk_constructorStandings_constructorId" FOREIGN KEY("constructorId")
REFERENCES "constructors" ("constructorId");

ALTER TABLE "driverStandings" ADD CONSTRAINT "fk_driverStandings_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "driverStandings" ADD CONSTRAINT "fk_driverStandings_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "lapTimes" ADD CONSTRAINT "fk_lapTimes_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "lapTimes" ADD CONSTRAINT "fk_lapTimes_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "pitStops" ADD CONSTRAINT "fk_pitStops_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "pitStops" ADD CONSTRAINT "fk_pitStops_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "qualifying" ADD CONSTRAINT "fk_qualifying_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "qualifying" ADD CONSTRAINT "fk_qualifying_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "qualifying" ADD CONSTRAINT "fk_qualifying_constructorId" FOREIGN KEY("constructorId")
REFERENCES "constructors" ("constructorId");

ALTER TABLE "races" ADD CONSTRAINT "fk_races_year" FOREIGN KEY("year")
REFERENCES "seasons" ("year");

ALTER TABLE "races" ADD CONSTRAINT "fk_races_circuitId" FOREIGN KEY("circuitId")
REFERENCES "circuits" ("circuitId");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_constructorId" FOREIGN KEY("constructorId")
REFERENCES "constructors" ("constructorId");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_statusId" FOREIGN KEY("statusId")
REFERENCES "status" ("statusId");

ALTER TABLE "sprint_results" ADD CONSTRAINT "fk_sprint_results_raceId" FOREIGN KEY("raceId")
REFERENCES "races" ("raceId");

ALTER TABLE "sprint_results" ADD CONSTRAINT "fk_sprint_results_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "sprint_results" ADD CONSTRAINT "fk_sprint_results_constructorId" FOREIGN KEY("constructorId")
REFERENCES "constructors" ("constructorId");

ALTER TABLE "sprint_results" ADD CONSTRAINT "fk_sprint_results_statusId" FOREIGN KEY("statusId")
REFERENCES "status" ("statusId");