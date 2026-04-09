select *
from 2020_election_nh;

-- Vote count by party
select
	precinct,
    sum(case when party_detailed = 'Democrat' then votes else 0 end) as Dem_votes,
    sum(case when party_detailed = 'Republican' then votes else 0 end) as Rep_votes,
    sum(case when party_detailed = 'Libertarian' then votes else 0 end) as Lib_votes,
    sum(votes) as Total_Votes
from 2020_election_nh
group by precinct;

-- Democratic Voting Margin
-- Use CTE to sum then to create margin percentage
with Precinct_Summary as (
select
    precinct,
    sum(case when party_detailed = 'DEMOCRAT' then votes else 0 end) as Dem_votes,
    sum(case when party_detailed = 'REPUBLICAN' then votes else 0 end) as Rep_votes,
    sum(case when party_detailed = 'LIBERTARIAN' then votes else 0 end) as Lib_votes,
    sum(votes) as Total_Votes
from 2020_election_nh
where office = 'US PRESIDENT'  -- Found to be 'US PRESIDENT' in your file
group by 1
)

select
    precinct,
    Dem_votes,
    Rep_votes,
    Lib_votes,
    Total_Votes,
    (Dem_votes - Rep_votes - Lib_votes) as raw_margin,
    round(((Dem_votes - Rep_votes - Lib_votes) * 100.0 / nullif(Total_Votes, 0)), 2) as Democratic_margin_percentage
from Precinct_Summary
where Total_Votes > 0
order by Democratic_margin_percentage desc;

-- Ticket Splitting
-- Voted for Biden for President but not Feltes for Governor
select
    precinct,
    sum(case when candidate = 'JOSEPH R BIDEN' then votes else 0 end) as Biden_votes,
    sum(case when candidate = 'Dan Feltes' then votes else 0 end) as Gov_votes,
    sum(case when candidate = 'JOSEPH R BIDEN' then votes else 0 end) - sum(case when candidate = 'Dan Feltes' then votes else 0 end) as Vote_drop
from 2020_election_nh
where office = 'US PRESIDENT'  -- Found to be 'US PRESIDENT' in your file
group by precinct
having Vote_Drop > 0
order by Vote_Drop;

select distinct candidate
from 2020_election_nh;

-- Lots of sql trouble shooting because the Table Import Wizard wouldn't read all the rows

DROP TABLE 2020_election_nh;

DROP TABLE IF EXISTS 2020_election_nh;

CREATE TABLE 2020_election_nh (
    precinct VARCHAR(255),
    office VARCHAR(255),
    party_detailed VARCHAR(255),
    party_simplified VARCHAR(255),
    mode VARCHAR(50),
    votes INT,
    county_name VARCHAR(255),
    county_fips INT,
    jurisdiction_name VARCHAR(255),
    jurisdiction_fips INT,
    candidate VARCHAR(255),
    district VARCHAR(50),      -- This MUST be VARCHAR or TEXT, not INT
    magnitude INT,
    dataverse VARCHAR(50),
    year INT,
    stage VARCHAR(50),
    state VARCHAR(50),
    special VARCHAR(50),
    writein VARCHAR(50),
    state_po VARCHAR(10),
    state_fips INT,
    state_cen INT,
    state_ic INT,
    date VARCHAR(50),
    readme_check VARCHAR(50)
);

DROP TABLE IF EXISTS 2020_election_nh;

CREATE TABLE 2020_election_nh (
    precinct TEXT,
    office TEXT,
    party_detailed TEXT,
    party_simplified TEXT,
    mode TEXT,
    votes INT,
    county_name TEXT,
    county_fips INT,
    jurisdiction_name TEXT,
    jurisdiction_fips BIGINT,  -- Changed from INT to BIGINT
    candidate TEXT,
    district TEXT,            -- Keep as TEXT for 'STATEWIDE'
    magnitude INT,
    dataverse TEXT,
    year INT,
    stage TEXT,
    state TEXT,
    special TEXT,             -- Keep as TEXT for 'TRUE'/'FALSE'
    writein TEXT,
    state_po TEXT,
    state_fips INT,
    state_cen INT,
    state_ic INT,
    date TEXT,
    readme_check TEXT
);

SET GLOBAL local_infile = 1; -- Enables local loading

-- The Import Wizard kept failing so imported via sql

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2020_Election_NH.csv'
INTO TABLE 2020_election_nh
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;