#!/bin/bash

ssh isucon1 -L 30001:118.27.25.147:19999 -fN
ssh isucon2 -L 30002:118.27.26.87:19999 -fN
ssh isucon3 -L 30003:118.27.19.222:19999 -fN