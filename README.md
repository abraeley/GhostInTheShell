** IN DEVELOPMENT **




The GhostInTheShell Application is meant to be a "research assistant", although use can easily be extended to scraping the internet for articles or web pages of interest.

The core functionality is to set up a cron job on a Linux system (personal computer or server). The cron job will run once per week and will call out the initiateGhost.sh shell script. When initiating this shell script, several parameters are to be passed in. Each parameter is going to be considered a keyword representing a subject-of-interest with which the application will check articles against as it scrapes the web. Any articles deemed by the application to be of significant enough relevance will have their titles, a URL link to them, and the article abstract emailed to the User of the Linux account.


The architecture of this application is as follows:

Researcher is seeking to automate the discovery of articles pertaining to a Venus tessera site, especially articles using Magellan data. The researcher decides to use "Venus", "tessera", and "Magellan" as the keyword arguments to assist GhostInTheShell to help them in finding articles pertaining to those three subjects.

- The operating system runs the cron job each week

- Cron job runs the shell script:
sh initiateGhost.sh Venus tessera Magellan

- The shell script initiateGhost.sh calls ghostScraper.py, passing in the three parameters (Venus, tessera, and Magellan)

- ghostScraper.py scrapes a list of predetermined websites for articles that contain keyword matches with the parameters (again, in this case the parameters are Venus, tessera, and Magellan).

- The ghostScraper.py script then calls the subjectFilter.py script, again passing in the parameters/subject-matter keywords. The subjectFilter.py script uses a natural language processing package and the parameters passed in to determine if the articles contain information relevant enough to bring them to the researcher's attention. subjectFilter.py then inserts information from all detected matches into the results.db database (The information in this case would be the article URL, the article title, and the article abstract). A boolean flag is then returned to ghostScraper.py, which returns a process-complete-flag to initiateGhost.sh notifying it that the filtering process has been completed.

- initiateGhost.sh then emails the contents of results.db to the User account of the Linux operating system (the researcher). At this point the researcher is set up with an automated application to assist them in finding interesting and relevant scholarly articles.

- Numerous extensions are planned for this application, to make it more user-friendly, as well as to give it a GUI interface for users to work with and added functionality.
