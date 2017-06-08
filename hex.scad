/*  hex v1 OpenSCAD Library
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
        w = The width of the hexegon measured from side to side.
*/


module hex(w)
{
    littleR = 0.5*w;
    echo(littleR=littleR);
    bigR = littleR / cos(30);
    echo(bigR=bigR);
    t = sqrt((bigR * bigR) - (littleR * littleR));
    echo(t=t);
    
    polygon(points=[[0,bigR], 
            [littleR, t], 
            [littleR, -t], 
            [0,-bigR], 
            [-littleR, -t], 
            [-littleR, t]]);
    
}

module roundedHex(w)
{
    littleR = 0.5*w;
    echo(littleR=littleR);
    bigR = littleR / cos(30);
    echo(bigR=bigR);
    t = sqrt((bigR * bigR) - (littleR * littleR));
    echo(t=t);
    
    difference() {
        polygon(points=[[0,bigR], 
            [littleR, t], 
            [littleR, -t], 
            [0,-bigR], 
            [-littleR, -t], 
            [-littleR, t]]);
        difference () {
            circle(bigR+1);
            circle(bigR-0.1);
        }
    }
    
}
