#!/bin/bash

# Redis 실시간 통계를 확인 해보자
redis-cli -c -h <URL> -p 6379 --stat

# Redis에서 key 목록을 조회해보자
keys *

# 타입별로 큰 키값을 찾아보자
redis-cli -c -h <URL> -p 6379 --bigkeys

# pattern으로 key를 찾아보자
redis-cli -c -h <URL> -p 6379 --pattern <key> 

# redis 응답시간을 알아보자
redis-cli -c -h <URL> -p 6379 --latency

# redis 초단위로 응답시간을 알아보자
redis-cli -c -h <URL> -p 6379 --latency -i <second>

# redis 응답시간을 문자열로 확인 해보자. static void latencyDistMode(void) 
redis-cli -c -h <URL> -p 6379 --latency-dist
