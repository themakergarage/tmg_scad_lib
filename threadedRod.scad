/*  threadedRod v0.1 OpenSCAD Library
    Copyright (C) 2017 The Maker Garage

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
  

    Use:
        id = The inner diameter of the rod.  This can be found by measuring the inside diameter of a female connector.  Remember to account fot tolerances.
        
        od = the outside diameter of the rod.  This can be found by measuring the diameter of the threaded rod itself.
        
        h = The height of the threaded rod
        
        p = the pitch of the threads.  This is the distance between the threads.  It can most easily be measured by using the distance between the peaks of the threads.  A positive pitch will result in right handed threads.  A negative pitch will result in left handed threads.
*/

module threadedRod( id, od, h, p )
{
    // Identify the total number of threads (i.e. twists) needed
    totalTwist = (-360 * (h/p));
    echo(totalTwist=totalTwist);
    
    // Identify the depth of the thread
    threadOffset = (od - id)/2;
    echo(threadOffset=threadOffset);
    
    // Identify the radius of the offset circle
    threadRadius = (od - threadOffset)/2;
    echo(threadRadius=threadRadius);

    // Create Threaded Rod
    linear_extrude(height = h, center = false, convexity = 10, twist = totalTwist)
    translate([threadOffset, 0, 0])
    circle(r=threadRadius);

}