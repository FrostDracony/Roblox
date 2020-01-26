#Get the Corners of a BasePart
##Table of Contents

*[Get the Corners of a normal Part](#get-the-corners-of-a-normal-part)

## Get the Corners of a normal Part
In this tutorial I will deal with getting the corners of a part. These can be used for many other things, for example to control a part into a certain region without using the function game.Workspace:FindPartInRegion3(). Let's start now. To get the parts to a non-rotating part you need a formula. For this it is better to paint a skize. Here is what I painted (I'm not an artist so please no criticism):  

In this skize you can see how you can get all the corners of a normal part. The technique is to use vectors, just being able to read a bit, turn everything into vectors and there you have it! The Skize:

The result is this:

Yes, it works, but it still remains a problem:

As you can see, if our part turns, our corners don't position themselves where they should and this can lead to unwanted results. But you have to use CFrames to transform the corners in the object space, as it says in the wiki we just have to multiply the two CFrames and the final result:
