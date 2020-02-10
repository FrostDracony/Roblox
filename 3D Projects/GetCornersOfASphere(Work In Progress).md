# Get the Corners of a sphere shaped BasePart

## Table of Contents

* [Get the Corners of a sphere shaped Part](#get-the-corners-of-a-sphere-shaped-part)

## Get the Corners of a sphere shaped Part
In this tutorial I will deal with getting the corners of a sphere shaped part. These can be used for many other things, for example to control a part into a certain region without using the function game.Workspace:FindPartInRegion3(). Let's start now. In this tutorial each corner is represented by a part which is 0.01x0.01x0.01. So you can see if the corner is really there where it should be. To get the corners of a non-rotating part you need a formula. For this it is better to paint a sketch. Here is what I painted (I'm not an artist so please no criticism):

In this sketch you can see how you can get all the corners of a sphere. I will use vectors, then only see the Picture and with a bit math we have our Idea!

![IMG_1508](imgs/GetCornersOfASphere/IMG_1508.jpeg)

Ok
