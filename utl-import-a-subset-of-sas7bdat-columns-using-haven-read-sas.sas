Import a subset of sas7bdat columns using haven read sas

Note you can limit columns but not rows. Microsoft R package, RevoScaleR, can
limit rows in a sas7bdat, but the installation is complex and a 'free'
setup has limitations? I only want the sas(READ/WRITE?) rxImport functionality not all
the other stuff. RevoScaleR is not available from CRAN.

see github
https://tinyurl.com/yab7gnxo
https://github.com/rogerjdeangelis/utl-import-a-subset-of-sas7bdat-columns-using-haven-read-sas

see StackOverflow
https://tinyurl.com/yd9tc4z6
https://stackoverflow.com/questions/53135084/error-message-in-read-sas-haven-package-using-cols-only-to-read-in-only-subset


INPUT
=====

 SD1.HAVE total obs=19

  NAME       SEX    AGE    HEIGHT    WEIGHT

  Alfred      M      14     69.0      112.5
  Alice       F      13     56.5       84.0
  Barbara     F      13     65.3       98.0
  ....
  Ronald      M      15     67.0      133.0
  Thomas      M      11     57.5       85.0
  William     M      15     66.5      112.0


EXAMPLE OUTPUT
--------------

IN R workspace

'data.frame':	19 obs. of  2 variables:
 $ NAME: chr  "Alfred" "Alice" "Barbara" "Carol" ...
 $ SEX : chr  "M" "F" "F" "F" ...
 - attr(*, "label")= chr "HAVE"

     NAME  SEX

 1  Alfred   M
 2   Alice   F
 3 Barbara   F
 4   Carol   F
 5   Henry   M
 6   James   M


PROCESS
=======

%utl_submit_r64('
library(haven);
have<-as.data.frame(read_sas("d:/sd1/have.sas7bdat",cols_only = c("NAME","SEX")));
str(have);
head(have);
');

MAKE DATA
=========

options validvarname=upcase;

libname sd1 "d:/sd1";

data sd1.have;
  set sashelp.class;
run;quit;




