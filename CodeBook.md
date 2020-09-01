Referring to features_info.txt the column names were changed using regex(regular expressions) by calling the gsub() function, The replacements were as follows:

|No|            Pattern|                Replacement|
|--|-------------------|---------------------------|             
|1 |                 ^t|                       Time|
|2 |                 ^f|                  Frequency|
|3 |                Acc|              Accelarometer|
|4 |               Gyro|                  Gyroscope|
|5 |                Mag|                  Magnitude|
|6 |        -mean[(][)]|                       Mean|
|7 |         -std[(][)]|         Standard deviation|
|8 |         -mad[(][)]|  Median absolute deviation|
|9 |         -max[(][)]|                    Maximum|
|10|         -min[(][)]|                    Minimum|
|11|         -sma[(][)]|      Signal magnitude area|
|12|      -energy[(][)]|             Energy measure|
|13|         -iqr[(][)]|        Interquartile range|
|14|     -entropy[(][)]|             Signal entropy|
|15|     -arCoeff[(][)]| Autorregresion coefficient|
|16| -correlation[(][)]|    Correlation coefficient|
|17|           -maxInds|              Largest index|
|18|    -meanFreq[(][)]|             Mean frequency|
|19|    -skewness[(][)]|                   Skewness|
|20|    -kurtosis[(][)]|                   Kurtosis|
|21| -bandsEnergy[(][)]|               Bands energy|
|22|       -angle[(][)]|                      Angle|
|23|               Body|                      Body*|
|24|            Gravity|                   Gravity*|

(* has white space)

The first 6 column names of the 563 variables(features) after calling gsub():

             Before                                        After

1 tBodyAcc-mean()-X                  TimeBodyAccelarometerMean.X
2 tBodyAcc-mean()-Y                  TimeBodyAccelarometerMean.Y
3 tBodyAcc-mean()-Z                  TimeBodyAccelarometerMean.Z
4  tBodyAcc-std()-X    TimeBodyAccelarometerStandard.deviation.X
5  tBodyAcc-std()-Y    TimeBodyAccelarometerStandard.deviation.Y
6  tBodyAcc-std()-Z    TimeBodyAccelarometerStandard.deviation.Z
