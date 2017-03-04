+++
Description = "Journey into Machine Learning."
date = "2017-03-01T20:13:00-05:00"
menu = "main"
title = "machine learning"
+++

Machine Learning is a topic that I've been interested in for years, but have
never taken the time to learn. I've recently found some articles and projects
that looked interesting, which I link to later. But before I really jump into
any of those I thought I should start at the beginning with an introduction
to machine learning.

The [Machine Learning](https://www.coursera.org/learn/machine-learning) course
taught by [Andrew Ng](http://www.andrewng.org/) seems to be the seminal course.
I also found [Intro to Machine Learning](https://www.udacity.com/course/intro-to-machine-learning--ud120) available
on Udacity is taught by [Sebastian Thrun](http://robots.stanford.edu/) and [Katie Malone](https://twitter.com/multiarmbandit).

I decided to try out the Udacity course since I've never really tried their courses before.

Here are links to articles, blog posts and projects that look interesting:

* [Machine Learning Crash Course](https://ml.berkeley.edu/blog/2016/11/06/tutorial-1/)
* [ML-From-Scratch](https://github.com/eriklindernoren/ML-From-Scratch)
* [Awesome Deep Learning Papers](https://github.com/terryum/awesome-deep-learning-papers)
* [The Unreasonable Effectiveness of Recurrent Neural Networks](http://karpathy.github.io/2015/05/21/rnn-effectiveness/)
* [Gentlest Introduction to TensorFlow](https://medium.com/all-of-us-are-belong-to-machines/the-gentlest-introduction-to-tensorflow-248dc871a224#.il98kd2r1)
* [Partial Derivatives](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/partial-derivatives/v/partial-derivatives-introduction) and Basic Matrix Operations [1](https://www.khanacademy.org/math/precalculus/precalc-matrices/intro-to-matrices/v/introduction-to-the-matrix), [2](https://www.youtube.com/watch?v=xr6qsiEznKU), [3](https://users.cs.duke.edu/~reif/courses/alglectures/littman.lectures/lect15/node7.html).

My plan is to update this page from time to time with notes and my status on my
journey to grokking Machine Learning.

---

* March 01, 2017 - start [Intro to Machine Learning](https://www.udacity.com/course/intro-to-machine-learning--ud120)
* March 03, 2017 - Completed Naive Bayes section of course
  * machine learning finds the decision surface (aka decision boundary), separates one class from another to generalize new data points
  * algorithms are divided into two types: supervised vs unsupervised
  * Bayes Algorithm
    * Prior Probability x Test Evidence -> Posterior Probability
  * Naive Bayes algorithm
    * supervised
    * usually used for text learning
    * looks at word frequencies, not word order
    * given the frequency of words for a person, multiply the probability for each word and then multiply that by the prior probability. Do that for each person. For example, If you have two people, perform the multiplication for Person A and Person B, this will give you the ratio of whether it was Person A or Person B.
    * It is good for classifying texts because of its simplicity and the independent features.
    * Example where it fails, "Chicago Bulls". Since the algorithm ignores word order it would treat it as "Chicago" and "Bulls".
