# MCA-Stable-Matching
Consider a scenario with 10 communication nodes that autonomously harvest energy from the environment in the harvest state and then attempt to transmit data with a certain amount of energy (based on the energy harvested in the previous state) to a common receiver in the transmit state. Assume that the amount of energy harvested by each node in the first state (denoted as Ψ) is a random variable in the range [0,1]. Each node knows its own energy and also knows the distribution of energy of other nodes (the distributions are iid). Assume that each node transmits on a separate frequency, and consider 10 separate and independent frequency channels between the nodes and the receiver.

The receiver can be informed of the energy harvesting status of the nodes. Each frequency channel also has random gains with an exponential distribution and an average of 1. The decision to transmit or not in each frequency channel is announced to the nodes by the receiver. In each transmission state, independent decisions are made. Additionally, assume that each node transmits with all the energy it has harvested in the harvest state. Furthermore, in each state, each node can transmit at most once. In the long term (after performing a large number of allocation actions to obtain consistent results), find the average energy received by the receiver in each transmission state if,

Okay, here's a silly translation:

a- We tell each node which frequency channel to use using a one-to-one matching approach. For this purpose, assume that each frequency channel ranks nodes based on energy level, and each node also ranks frequency channels based on its own channel utilization. (Note that the channel utilization of each frequency channel is determined independently between the receiver and a node, so in total we will have 100 independent utilizations in each transmission state.) Also, consider starting the algorithm once from the side of the nodes and then again from the side of the channels.

b- Let's do part A using a matching matching many-to-one approach, so that at most two nodes can transmit on each frequency channel, and as a result, some frequency channels may remain unused.


About stable matching algorithm

[Men Courtship Algorithm]https://en.wikipedia.org/wiki/Gale%E2%80%93Shapley_algorithm
