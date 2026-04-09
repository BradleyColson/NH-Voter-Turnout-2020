# NH-Voter-Turnout-2020
Identify key blue voting areas

# Voting
### Analyzising voter turn out for 2020 Presidential election in New Hampshire

Use MySQL to discover deep blue voter areas over 50% in New Hampshire Presidential Election 2020

### Project Overview
The Goal: I used MySQL to identify "Deep Blue" strongholds and see how turnout shifted across New Hampshire's 10 counties in the 2020 Presidential election.

Technical Process:
The trickiest part was the aggregation. NH reports data at the ward level, but to see the real impact, I had to write SQL queries that consolidated those wards into full city/town totals (especially for bigger hubs like Manchester and Nashua).

What the Data Showed:

The University Factor: My analysis confirmed that university towns are the biggest outliers. Hanover and Durham saw margins of +74% and +52% respectively.

The Battlegrounds: I found that while the big cities (Manchester/Nashua) are blue, mid-sized towns like Merrimack and Bedford are the real "purple" areas where the margins were razor-thin (under 5%).



| City / Town | County | Leading Party | Total Votes |
| :--- | :--- | :--- | :--- |
| **MANCHESTER** | Hillsborough | Democrat | 52,606 |
| **NASHUA** | Hillsborough | Democrat | 45,281 |
| **CONCORD** | Merrimack | Democrat | 23,868 |
| **DOVER** | Strafford | Democrat | 19,185 |
| **DERRY** | Rockingham | Republican | 17,894 |
| **SALEM** | Rockingham | Republican | 17,841 |
| **ROCHESTER** | Strafford | Republican | 16,845 |
| **MERRIMACK** | Hillsborough | Democrat | 16,697 |
| **LONDONDERRY** | Rockingham | Republican | 15,873 |
| **BEDFORD** | Hillsborough | Democrat | 14,739 |

Top Democratic areas by margin 2020 Presidential election.

| Precinct | Dem_Votes | Rep_Votes | Lib_Votes | Total_Votes | Raw_Margin | Dem_Margin_% |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **HANOVER** | 6,210 | 841 | 66 | 7,117 | 5,303 | +74.51% |
| **LYME** | 1,074 | 218 | 13 | 1,305 | 843 | +64.60% |
| **PORTSMOUTH WARD 2** | 2,645 | 699 | 49 | 3,393 | 1,897 | +55.91% |
| **PORTSMOUTH WARD 5** | 2,207 | 623 | 27 | 2,857 | 1,557 | +54.50% |
| **DURHAM** | 5,970 | 1,712 | 128 | 7,810 | 4,130 | +52.88% |
| **LEBANON WARD 1** | 2,020 | 635 | 30 | 2,685 | 1,355 | +50.47% |



