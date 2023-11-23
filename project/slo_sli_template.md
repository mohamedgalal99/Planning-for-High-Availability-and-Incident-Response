| Category     | SLI                                                                    | SLO                                                                                                         |
|--------------|------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Number of successful req / total number of req                         | 99%                                                                                                         |
| Latency      | histogram quantil that show buckets, 90% of requests finished <= 100ms | 90% of requests below 100ms                                                                                 |
| Error Budget | 1 - availability                                                       | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | Total number of successful requests                                    | 5 RPS indicates the application is functioning                                                              |
