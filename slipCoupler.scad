/*  Slip Coupler v0.1 OpenSCAD Library
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
    
*/

/*  To Do:
    - Add Error Checking
    - Add Support for 0 length (flat) transition
    - Improve documentation for library and each module
    - Enhance to be a universal coupler
        - Refactor to support each fitting type as a module
        - Add support for threaded fittings
        - Add support for hose bard fittings
        - Add support for english_units
*/

nps_fitting(1, "female");

function imp2metric(x) = x*25.4;
function metric2imp (x) = x/25.4;

module slip_fitting(diameter, length, thickness, gender, units)
{
    //Convert Imperial to Metric (default is metric)
    thickness= units == "imperial" ? imp2metric(thickness) : thickness;
    diameter= units == "imperial" ? imp2metric(diameter) : diameter;
    length= units == "imperial" ? imp2metric(length) : length;
    
    //Validate thickness (default is 2mm)
    t= thickness>0 ? thickness : 2;
    
    //Validate diameter (default is 10mm)
    d= diameter > 0 ? diameter : 10;
    
    //Validate Length (default is 10mm)
    ol= length > 0 ? length : 10;

    // If female add stop
    il= gender == "male" ? ol : ol-t;

    //Checks gender and set diameters (default is female)
    od= gender == "male" ? d : d+t+t+0.9;
    id= gender == "male" ? d-t-t : d+0.9;
        
    difference ()  //Build Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, 0]) cylinder(h=ol, d=od);
            //Subtract Inner Cylinder
            translate ([0, 0, 0]) cylinder(h=il, d=id);
            translate ([0, 0, 0]) cylinder(h=ol, d=(id-t-t));
        };
};

module nps_fitting(nps, gender, schedule)
{
    //  Values based on:  
    //  http://www.engineersedge.com/pipe_schedules.htm
    //  Retrieved on 4/28/2017
    if(nps == 0.125)
    {
        if (schedule == "5")
        {
            slip_fitting(0.405, 1, 0.035, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(0.405, 1, 0.049, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(0.405, 1, 0.095, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(0.405, 1, 0.068, gender, "imperial"); 
        }
    }
    else if (nps == 0.25)
    {
        if (schedule == "5")
        {
            slip_fitting(0.540, 1, 0.049, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(0.540, 1, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(0.540, 1, 0.119, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(0.540, 1, 0.088, gender, "imperial"); 
        }
    }
    else if (nps == 0.375)
    {
        if (schedule == "5")
        {
            slip_fitting(0.675, 1, 0.049, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(0.675, 1, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(0.675, 1, 0.126, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(0.675, 1, 0.091, gender, "imperial"); 
        }
    }
    else if (nps == 0.5)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(0.840, 1, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(0.840, 1, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(0.840, 1, 0.147, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(0.840, 1, 0.187, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(0.840, 1, 0.109, gender, "imperial"); 
        }
    }
    else if (nps == 0.75)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(1.050, 1, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(1.050, 1, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(1.050, 1, 0.154, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(1.050, 1, 0.218, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(1.050, 1, 0.113, gender, "imperial"); 
        }
    }
    else if (nps == 1)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(1.315, 1, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(1.315, 1, 0.109, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(1.315, 1, 0.179, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(1.315, 1, 0.250, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(1.315, 1, 0.133, gender, "imperial"); 
        }
    }
    else if (nps == 1.25)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(1.660, 1.25, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(1.660, 1.25, 0.109, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(1.660, 1.25, 0.191, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(1.660, 1.25, 0.250, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(1.660, 1.25, 0.140, gender, "imperial"); 
        }
    }
    else if (nps == 1.5)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(1.900, 1.5, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(1.900, 1.5, 0.109, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(1.900, 1.5, 0.200, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(1.900, 1.5, 0.281, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(1.900, 1.5, 0.145, gender, "imperial"); 
        }
    }
    else if (nps == 2)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(2.375, 2, 0.065, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(2.375, 2, 0.109, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(2.375, 2, 0.218, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(2.375, 2, 0.343, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(2.375, 2, 0.154, gender, "imperial"); 
        }
    }
    else if (nps == 2.5)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(2.875, 2.5, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(2.875, 2.5, 0.120, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(2.875, 2.5, 0.276, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(2.875, 2.5, 0.375, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(2.875, 2.5, 0.203, gender, "imperial"); 
        }
    }
    else if (nps == 3)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(3.500, 3, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(3.500, 3, 0.120, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(3.500, 3, 0.300, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(3.500, 3, 0.437, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(3.500, 3, 0.216, gender, "imperial"); 
        }
    }
    else if (nps == 3.5)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(4.000, 3.5, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(4.000, 3.5, 0.120, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(4.000, 3.5, 0.318, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(4.000, 3.5, 0.226, gender, "imperial"); 
        }
    }
    else if (nps == 4)
    {
        if ((schedule == "5s") || (schedule == "5"))
        {
            slip_fitting(4.500, 4, 0.083, gender, "imperial"); 
        }
        else if ((schedule == "10s") || (schedule == "10"))
        {
            slip_fitting(4.500, 4, 0.120, gender, "imperial"); 
        }
        else if (schedule == "60")
        {
            slip_fitting(4.500, 4, 0.281, gender, "imperial"); 
        }
        else if ((schedule == "80s") || (schedule == "80"))
        {
            slip_fitting(4.500, 4, 0.337, gender, "imperial"); 
        }
        else if (schedule == "120")
        {
            slip_fitting(4.500, 4, 0.437, gender, "imperial"); 
        }
        else if (schedule == "160")
        {
            slip_fitting(4.500, 4, 0.531, gender, "imperial"); 
        }
        else
        {
            //Defaulting to Schedule 40/40s/standard
            slip_fitting(4.500, 4, 0.237, gender, "imperial"); 
        }
    }
        

};

module coupler(bottomDiameter, bottomDepth, bottomType, bottomUnits, bottomGender, topDiameter, topDepth, transitionLength, wallThickness)
{
};
module f2f_slip_coupler(bottomDiameter, bottomDepth, topDiameter, topDepth, transitionLength, wallThickness)
{
    union ()  //Combine Bottom, Transition, and Top
    {
        //translate([0, 0, 0]) slip_fitting(bottomDiameter, bottomDepth, wallThickness, "female", "metric");
        /*difference ()  //Build Bottom Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=(bottomDiameter+wallThickness+wallThickness));
            //Subtract Inner Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=bottomDiameter);
        };*/
        
        difference ()  //Build Transition
        {
            //Create Outer Cone
            translate ([0, 0, bottomDepth]) cylinder(h=(transitionLength), d1=(bottomDiameter+wallThickness+wallThickness), d2=(topDiameter+wallThickness+wallThickness));
            //Create Inner Cone
            translate ([0, 0, bottomDepth]) cylinder(h=(transitionLength), d1=bottomDiameter, d2=topDiameter);
        };
        
        difference ()  //Build Top Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth, d=(topDiameter+wallThickness+wallThickness));
            //Subtract Inner Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth+2, d=topDiameter);
        };
        
    };
};

module m2m_slip_coupler(bottomDiameter, bottomDepth, topDiameter, topDepth, transitionLength, wallThickness)
{
    union ()  //Combine Bottom, Transition, and Top
    {
        
        difference ()  //Build Bottom Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=bottomDiameter);
            //Subtract Inner Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=(bottomDiameter-wallThickness-wallThickness));
        };
        
        difference ()  //Build Transition
        {
            //Create Outer Cone
            translate ([0, 0, bottomDepth]) cylinder(h=transitionLength, d1=bottomDiameter, d2=topDiameter);
            //Create Inner Cone
            translate ([0, 0, bottomDepth]) cylinder(h=transitionLength, d1=(bottomDiameter-wallThickness-wallThickness), d2=(topDiameter-wallThickness-wallThickness));
        };
        
        difference ()  //Build Top Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth, d=topDiameter);
            //Subtract Inner Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth, d=(topDiameter-wallThickness-wallThickness));
        };
        
    };
};

module f2m_slip_coupler(bottomDiameter, bottomDepth, topDiameter, topDepth, transitionLength, wallThickness)
{
    union ()  //Combine Bottom, Transition, and Top
    {
        
        difference ()  //Build Bottom Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=(bottomDiameter+wallThickness+wallThickness));
            //Subtract Inner Cylinder
            translate ([0, 0, 0]) cylinder(h=bottomDepth, d=bottomDiameter);
        };
        
        difference ()  //Build Transition
        {
            //Create Outer Cone
            translate ([0, 0, bottomDepth]) cylinder(h=(transitionLength), d1=(bottomDiameter+wallThickness+wallThickness), d2=topDiameter);
            //Create Inner Cone
            translate ([0, 0, bottomDepth]) cylinder(h=(transitionLength), d1=bottomDiameter, d2=(topDiameter-wallThickness-wallThickness));
        };
        
        difference ()  //Build Top Coupler
        {
            //Create Outer Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth, d=topDiameter);
            //Subtract Inner Cylinder
            translate ([0, 0, (bottomDepth+transitionLength)]) cylinder(h=topDepth, d=(topDiameter-wallThickness-wallThickness));
        };
        
    };
};