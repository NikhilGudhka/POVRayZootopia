/*
 *   Copyright (c) 2017 Nikhil Gudhka
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in all
 *   copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *   SOFTWARE.
 */


#include "colors.inc"
#include "glass.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapes3.inc"
#include "textures.inc"
#include "stones.inc"

//--------------------------------------------------------------------------------------------------- Start Camera Set up           
camera {
    right     x*image_width/image_height     
    location < 0,1.5,-10 >
    look_at  < 0,2,0 >
}
//--------------------------------------------------------------------------------------------------- End Camera Set up 

//--------------------------------------------------------------------------------------------------- Light Source For the entire scene    
light_source { 
    <-500,100,-50> 
    color rgb <0.35,0.4,0.3> 
}
//--------------------------------------------------------------------------------------------------- End Source For the entire scene  

//--------------------------------------------------------------------------------------------------- Start sky
sky_sphere { 
    pigment { 
        gradient <0,1,0>
            color_map { 
                [0.00 rgb <1.0,1.0,1.0>]
                [0.30 rgb <0.0,0.1,1.0>]
                [0.70 rgb <0.0,0.1,1.0>]
                [1.00 rgb <1.0,1.0,1.0>] 
            } 
         scale 2         
     }
}
//--------------------------------------------------------------------------------------------------- End sky

//--------------------------------------------------------------------------------------------------- Start Plane          
plane{ <0,1,0>, -0.01 
       texture{ 
                pigment{ color rgb <0.9,0.9,0.9>}
                finish { phong 0.1 } 
       }
}
//--------------------------------------------------------------------------------------------------- End Plane   

//--------------------------------------------------------------------------------------------------- Start Building Parameters
#declare wallThickness = 0.10;

#declare wallTexture1 = 
      texture { pigment{ color White*1.5 }
                normal { bumps 0.2 scale 0.005 } 
                finish { phong 1 }
              }
#declare wallTexture2 = 
      texture { pigment{ color White*1.5 }
                finish { phong 0.7 }
              }
#declare windowTexture1 = 
      texture{ pigment{ color White*1.3 }
               finish { phong 0.1 }
             }
#declare windowTexture2 = 
      texture{ pigment{ color White*1.2 }
               finish { phong 0.1 }
             }
//--------------------------------------------------------------------------------------------------- End Building Parameters             

//--------------------------------------------------------------------------------------------------- Start Transparent Window             
#declare window = 
    union{
         difference{
              box{ < 0.00,0.00,-0.02> , < 0.50,1.00,0.02> }
              box{ < 0.05,0.05,-0.03> , < 0.45,0.47,0.03> }
              box{ < 0.05,0.53,-0.03> , < 0.45,0.95,0.03> }
              texture { windowTexture1 }
         }
         box{ < 0.00,0.01,0.0> , < 0.49,0.99,0.001>
              //texture{ Glass }
              texture{ pigment { rgb <1.0,1.0,1.0> filter 0.8 }}
         }
} 
//--------------------------------------------------------------------------------------------------- End Transparent Window 

//--------------------------------------------------------------------------------------------------- Start Reflective Window
#declare window2 = 
    union{
         difference{
              box{ < 0.00,0.00,-0.02> , < 0.50,1.00,0.02> }
              box{ < 0.05,0.05,-0.03> , < 0.45,0.47,0.03> }
              box{ < 0.05,0.53,-0.03> , < 0.45,0.95,0.03> }
              texture { windowTexture1 }
         }
         box{ < 0.00,0.01,0.0> , < 0.49,0.99,0.001>
              texture{ 
            pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
            finish { 
                diffuse 0 
                reflection 0.4  
                specular 0.8 
                roughness 0.0003 
                phong 1 
                phong_size 400}   
                } 
             } 
        }  
//--------------------------------------------------------------------------------------------------- End Reflective Window            
#declare windowHole =
    box{<0.00,0.00,-0.50>,< 0.50,1.00,0.50>
         texture{ windowTexture2 }
}
       
#declare door = 
    union{
         difference{
              box{ < 0.00,0.01,-0.02> , < 0.80,1.30,0.02> }
              box{ < 0.05,0.05,-0.03> , < 0.75,0.60,0.03> }
              box{ < 0.05,0.77,-0.03> , < 0.75,1.25,0.03> }
              texture{windowTexture1}
         }                                      
         box{ < 0.00,0.01,0.0> , < 0.79,1.29,0.001>
              texture{ pigment { rgb <1.0,1.0,1.0> filter 0.8 }}
         }
}
         
#declare doorHole =
    box{< 0.00,0.01,-0.50>,< 0.80,1.30,0.50>
          texture{ windowTexture2 }
}    

#declare Bld1Heightx = 3.50;
#declare Bld1Heighty = 4.60;
#declare Bld1Heightz = 2.50;

#declare Bld2Heightx = 3.00;
#declare Bld2Heighty = 3.60;
#declare Bld2Heightz = 1.90;

#declare Bld3Heightx = 3.50;
#declare Bld3Heighty = 4.60;
#declare Bld3Heightz = 2.50;

#declare Bld4Heightx = 4.00;
#declare Bld4Heighty = 5.00;
#declare Bld4Heightz = 2.00; 

#declare BackBld1Heightx = 6.00;
#declare BackBld1Heighty = 8.00;
#declare BackBld1Heightz = 2.00;

#declare BackBld2Heightx = 4.00;
#declare BackBld2Heighty = 7.00;
#declare BackBld2Heightz = 2.00;

#declare BackBld3Heightx = 10.00;
#declare BackBld3Heighty = 7.50;
#declare BackBld3Heightz = 2.00; 

#declare BackBld4Heightx = 7.00;
#declare BackBld4Heighty = 8.00;
#declare BackBld4Heightz = 2.00;

#declare FrontBld1Heightx = 7.00;
#declare FrontBld1Heighty = 8.00;
#declare FrontBld1Heightz = 2.00;

#declare FrontBld2Heightx = 7.00;
#declare FrontBld2Heighty = 8.00;
#declare FrontBld2Heightz = 2.00;

//--------------------------------------------------------------------------------------------------- Counting from left to Right
#declare bld1door       = < 1.35,0.01,0.01/3 >;
#declare bld1topWindow1 = < 0.6,2.9,0.01/3 >; 
#declare bld1topWindow2 = < 2.4,2.9,0.01/3 >;
#declare bld1topWindow3 = < 1.5,2.9,0.01/3 >;
#declare bld1midWindow1 = < 0.6,1.6,0.01/3 >;
#declare bld1midWindow2 = < 2.4,1.6,0.01/3 >;
#declare bld1midWindow3 = < 1.5,1.6,0.01/3 >;

#declare bld2door       = < 1.1,0.01,0.01/3 >;
#declare bld2topWindow1 = < 0.5,2.1,0.01/3 >; 
#declare bld2topWindow2 = < 2.0,2.1,0.01/3 >;

#declare bld3door       = < 1.35,0.01,0.01/3 >;
#declare bld3topWindow1 = < 0.5,2.9,0.01/3 >; 
#declare bld3topWindow2 = < 1.5,2.9,0.01/3 >;
#declare bld3topWindow3 = < 2.5,2.9,0.01/3 >;
#declare bld3midWindow1 = < 0.5,1.7,0.01/3 >;
#declare bld3midWindow2 = < 1.5,1.7,0.01/3 >;
#declare bld3midWindow3 = < 2.5,1.7,0.01/3 >;

#declare bld4door       = < 1.5,0.01,0.01/3 >;
#declare bld4topWindow1 = < 0.5,3.1,0.01/3 >;
#declare bld4topWindow2 = < 1.5,3.1,0.01/3 >;
#declare bld4topWindow3 = < 2.5,3.1,0.01/3 >;
#declare bld4midWindow1 = < 0.5,2.0,0.01/3 >;
#declare bld4midWindow2 = < 1.5,2.0,0.01/3 >;
#declare bld4midWindow3 = < 2.5,2.0,0.01/3 >;
                                             
#declare Backbld1topWindow1 = < 1,6.3,0.01/3 >;
#declare Backbld1topWindow2 = < 3,6.3,0.01/3 >; 
#declare Backbld1topWindow3 = < 5,6.3,0.01/3 >;

#declare Backbld2topWindow1 = < 1,5.3,0.01/3 >; 
#declare Backbld2topWindow2 = < 2.5,5.3,0.01/3 >;

#declare Backbld3topWindow1 = < 1,5.8,0.01/3 >; 
#declare Backbld3topWindow2 = < 2.5,5.8,0.01/3 >;
#declare Backbld3topWindow3 = < 4,5.8,0.01/3 >; 
#declare Backbld3topWindow4 = < 5.5,5.8,0.01/3 >;
#declare Backbld3topWindow5 = < 7,5.8,0.01/3 >;
#declare Backbld3topWindow6 = < 8.5,5.8,0.01/3 >; 
#declare Backbld3midWindow1 = < 1,4.0,0.01/3 >;
#declare Backbld3midWindow2 = < 2.5,4.0,0.01/3 >;
#declare Backbld3midWindow3 = < 4,4.0,0.01/3 >;
#declare Backbld3midWindow4 = < 5.5,4.0,0.01/3 >;
#declare Backbld3midWindow5 = < 7,4.0,0.01/3 >;
#declare Backbld3midWindow6 = < 8.5,4.0,0.01/3 >;

#declare Backbld4topWindow1 = < 1,6.3,0.01/3 >; 
#declare Backbld4topWindow2 = < 3,6.3,0.01/3 >;
#declare Backbld4topWindow3 = < 5,6.3,0.01/3 >;

#declare Frontbld1topWindow1 = < 1,6.0,0.01/3 >; 
#declare Frontbld1topWindow2 = < 3,6.0,0.01/3 >;
#declare Frontbld1topWindow3 = < 5,6.0,0.01/3 >;
#declare Frontbld1midWindow1 = < 1,3.5,0.01/3 >;
#declare Frontbld1midWindow2 = < 3,3.5,0.01/3 >;
#declare Frontbld1midWindow3 = < 5,3.5,0.01/3 >;

#declare Frontbld2topWindow1 = < 1,6.0,0.01/3 >; 
#declare Frontbld2topWindow2 = < 3,6.0,0.01/3 >;
#declare Frontbld2topWindow3 = < 5,6.0,0.01/3 >;
#declare Frontbld2midWindow1 = < 1,3.5,0.01/3 >;
#declare Frontbld2midWindow2 = < 3,3.5,0.01/3 >;
#declare Frontbld2midWindow3 = < 5,3.5,0.01/3 >;
                                                       
//--------------------------------------------------------------------------------------------------- Building 1 START
union{
    difference{
        box { < 0,0,0 >,< Bld1Heightx,Bld1Heighty,Bld1Heightz>   
              texture { wallTexture1 }               
            }
        box { 
              < wallThickness,0.10,wallThickness>,
              < Bld1Heightx-wallThickness,Bld1Heighty-wallThickness,Bld1Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
            
        object{ doorHole translate bld1door} 
        object{ windowHole translate bld1topWindow1}
        object{ windowHole translate bld1topWindow2}
        object{ windowHole translate bld1topWindow3} 
        object{ windowHole translate bld1midWindow1}
        object{ windowHole translate bld1midWindow2}
        object{ windowHole translate bld1midWindow3}
    }
    
    object{ door translate bld1door}
    object{ window translate bld1topWindow1}
    object{ window translate bld1topWindow2}
    object{ window translate bld1topWindow3}
    object{ window translate bld1midWindow1}
    object{ window translate bld1midWindow2} 
    object{ window translate bld1midWindow3}
    
    translate <-9.75,0.1,0>    
}
box{ <0,0,0>, <2,2,0.003> 
    pigment { image_map { jpeg "zootopia2.jpg" map_type 0} scale<1.8,1.8,0> translate<0,0.2,0>} 
    rotate <0,1,0>*-30 translate <-9,4.60,0.3>}

#declare chairLeg =
cylinder { <0,0,0>,<0,2.00,0>, 0.30 

           texture { pigment { color Red }
                   }

           scale <0.5,1,0.5>*0.3
         }

union
{
    box{ 
        <0,0,0>,<0.5,0.1,0.5>
        pigment { color Red }
        translate <0,0.6,0>
         }

    object { chairLeg translate <0.05,0,0.05> } 
    object { chairLeg translate <0.45,0,0.05> }
    object { chairLeg translate <0.05,0,0.45> }
    object { chairLeg translate <0.45,0,0.45> } 
    
    translate <-8.5,0.2,0.3>
}
//--------------------------------------------------------------------------------------------------- Building 1 END  

//--------------------------------------------------------------------------------------------------- Building 2 START
union{
    difference{
        box { < 0,0,0 >,< Bld2Heightx,Bld2Heighty,Bld2Heightz>   
              //texture {wallTexture1}
              texture { pigment{ color rgb< 0.75, 0.65, 0.7> }
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture   
            }
        box { 
              < wallThickness,0.10,wallThickness>,
              < Bld2Heightx-wallThickness,Bld2Heighty-wallThickness,Bld2Heightz-wallThickness >  
              texture {wallTexture2}  
            }
            
        object{ doorHole translate bld2door}
        object{ windowHole translate bld2topWindow1}
        object{ windowHole translate bld2topWindow2} 
    }
    
    object{ door rotate <0,20*sin(clock*2*pi),0> translate bld2door}
    object{ window2 translate bld2topWindow1}
    object{ window2 translate bld2topWindow2} 
    
    translate <-6.0,0.1,0.2> 
} 
//--------------------------------------------------------------------------------------------------- Building 2 END  

//--------------------------------------------------------------------------------------------------- Building 3 START
union{
    difference{
        box { < 0,0,0 >,< Bld3Heightx,Bld3Heighty,Bld3Heightz >   
              texture { pigment{ color rgb< 0.75, 0.65, 0.7> } 
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              < Bld3Heightx-wallThickness,Bld3Heighty-wallThickness,Bld3Heightz-wallThickness >  
              texture {wallTexture2}  
            }
            
        object{ doorHole translate bld3door}
        object{ windowHole translate bld3topWindow1}
        object{ windowHole translate bld3topWindow2}
        object{ windowHole translate bld3topWindow3} 
        object{ windowHole translate bld3midWindow1}
        object{ windowHole translate bld3midWindow2}
        object{ windowHole translate bld3midWindow3} 
    }
    
    object{ door translate bld3door}
    object{ window2 translate bld3topWindow1}
    object{ window2 translate bld3topWindow2}
    object{ window2 translate bld3topWindow3}
    object{ window2 translate bld3midWindow1}
    object{ window2 translate bld3midWindow2}
    object{ window2 translate bld3midWindow3}  
    
    translate <2.2,0.1,-0.2>
}    
//--------------------------------------------------------------------------------------------------- Building 3 END    

//--------------------------------------------------------------------------------------------------- Building 4 START
union{
    difference{
        box { < 0,0,0 >,< Bld4Heightx,Bld4Heighty,Bld4Heightz >   
              texture { pigment{ color rgb< 1, 0.5, 0.5>*1.4  } 
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <Bld4Heightx-wallThickness,Bld4Heighty-wallThickness,Bld4Heightz-wallThickness>  
              texture { pigment { color <1.0,1.0,1.0> } }  
            }
            
        object{ doorHole translate bld4door}
        object{ windowHole translate bld4topWindow1}
        object{ windowHole translate bld4topWindow2}
        object{ windowHole translate bld4topWindow3} 
        object{ windowHole translate bld4midWindow1}
        object{ windowHole translate bld4midWindow2}
        object{ windowHole translate bld4midWindow3} 
    }
    
    object{ door translate bld4door}
    object{ window translate bld4topWindow1}
    object{ window translate bld4topWindow2}
    object{ window translate bld4topWindow3}
    object{ window translate bld4midWindow1}
    object{ window translate bld4midWindow2}
    object{ window translate bld4midWindow3}  
    
    translate <6,0.1,0>  
}                        
 box{ <0,0,0>, <2.3,2,0.003>
 pigment { image_map { png "zootopia1.png" map_type 0} scale<2.2,2,0> translate<0,0.2,0>}
 rotate <0,1,0>*10 translate <6,5,0.8>}
 
#declare chairLeg =
cylinder { <0,0,0>,<0,2.00,0>, 0.30 

           texture { pigment { color Red }
                   }

           scale <0.5,1,0.5>*0.3
         }

union
{
    box{ 
        <0,0,0>,<0.5,0.1,0.5>
        pigment { color Red }
        translate <0,0.6,0>
         }

    object { chairLeg translate <0.05,0,0.05> } 
    object { chairLeg translate <0.45,0,0.05> }
    object { chairLeg translate <0.05,0,0.45> }
    object { chairLeg translate <0.45,0,0.45> } 
    
    translate <7,2.2,0.3>
}

//--------------------------------------------------------------------------------------------------- Building 4 END
  
//--------------------------------------------------------------------------------------------------- BACK Building 1 START
union{
    difference{
        box { < 0,0,0 >,< BackBld1Heightx,BackBld1Heighty,BackBld1Heightz >   
              texture { pigment{ color rgb< 0.2, 0.5, 0.5>*1.4  }  
                   finish { phong 1 reflection 0.00}
                 } 
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <BackBld1Heightx-wallThickness,BackBld1Heighty-wallThickness,BackBld1Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Backbld1topWindow1}
        object{ windowHole translate Backbld1topWindow2} 
        object{ windowHole translate Backbld1topWindow3}
    }
    
    object{ window translate Backbld1topWindow1}
    object{ window translate Backbld1topWindow2}
    object{ window translate Backbld1topWindow3}
    
    translate <-14,0.1,5>
}
//--------------------------------------------------------------------------------------------------- BACK Building 1 END

//--------------------------------------------------------------------------------------------------- BACK Building 2 START
union{
    difference{
        box { < 0,0,0 >,< BackBld2Heightx,BackBld2Heighty,BackBld2Heightz >   
              texture { pigment{ color rgb< 0.7, 0.3, 0.7>*1.4  }   
                   finish { phong 1 reflection 0.00}
                 } 
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <BackBld2Heightx-wallThickness,BackBld2Heighty-wallThickness,BackBld2Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Backbld2topWindow1}
        object{ windowHole translate Backbld2topWindow2} 
    }
    
    object{ window translate Backbld2topWindow1}
    object{ window translate Backbld2topWindow2}
    
    translate <-7.4,0.1,5.3>
}
//--------------------------------------------------------------------------------------------------- BACK Building 2 END

//--------------------------------------------------------------------------------------------------- BACK Building 3 START
union{
    difference{
        box { < 0,0,0 >,< BackBld3Heightx,BackBld3Heighty,BackBld3Heightz >   
              texture { pigment{ color rgb< 0.7, 0.3, 0.5>*1.4  }   
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <BackBld3Heightx-wallThickness,BackBld3Heighty-wallThickness,BackBld3Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Backbld3topWindow1}
        object{ windowHole translate Backbld3topWindow2}
        object{ windowHole translate Backbld3topWindow3}
        object{ windowHole translate Backbld3topWindow4}
        object{ windowHole translate Backbld3topWindow5}
        object{ windowHole translate Backbld3topWindow6}
        object{ windowHole translate Backbld3midWindow1}
        object{ windowHole translate Backbld3midWindow2}
        object{ windowHole translate Backbld3midWindow3}
        object{ windowHole translate Backbld3midWindow4}
        object{ windowHole translate Backbld3midWindow5}
        object{ windowHole translate Backbld3midWindow6}
    }
    
    object{ window translate Backbld3topWindow1}
    object{ window translate Backbld3topWindow2}
    object{ window translate Backbld3topWindow3}
    object{ window translate Backbld3topWindow4}
    object{ window translate Backbld3topWindow5}
    object{ window translate Backbld3topWindow6}
    object{ window translate Backbld3midWindow1}
    object{ window translate Backbld3midWindow2}
    object{ window translate Backbld3midWindow3}
    object{ window translate Backbld3midWindow4}
    object{ window translate Backbld3midWindow5}
    object{ window translate Backbld3midWindow6}
    
    translate <-3.01,0.1,5.3>
}
//--------------------------------------------------------------------------------------------------- BACK Building 3 END 

//--------------------------------------------------------------------------------------------------- BACK Building 4 START
union{
    difference{
        box { < 0,0,0 >,< BackBld4Heightx,BackBld4Heighty,BackBld4Heightz >   
              texture { pigment{ color rgb< 0.7, 0.9, 0.5>*1.4  }   
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <BackBld4Heightx-wallThickness,BackBld4Heighty-wallThickness,BackBld4Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Backbld4topWindow1}
        object{ windowHole translate Backbld4topWindow2} 
        object{ windowHole translate Backbld4topWindow3} 
    }
    
    object{ window translate Backbld4topWindow1}
    object{ window translate Backbld4topWindow2}
    object{ window translate Backbld4topWindow3}
    
    translate <7.7,0.1,5.3>
}
//--------------------------------------------------------------------------------------------------- BACK Building 4 END

//--------------------------------------------------------------------------------------------------- Front Building 1 START
union{
    difference{
        box { < 0,0,0 >,< FrontBld1Heightx,FrontBld1Heighty,FrontBld1Heightz >   
              texture { pigment{ color rgb< 0.7, 0.4, 0.5>*1.4  }   
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <FrontBld1Heightx-wallThickness,FrontBld1Heighty-wallThickness,FrontBld1Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Frontbld1topWindow1}
        object{ windowHole translate Frontbld1topWindow2}
        object{ windowHole translate Frontbld1topWindow3} 
        object{ windowHole translate Frontbld1midWindow1}
        object{ windowHole translate Frontbld1midWindow2}
        object{ windowHole translate Frontbld1midWindow3}
    }
    
    object{ window translate Frontbld1topWindow1}
    object{ window translate Frontbld1topWindow2}
    object{ window translate Frontbld1topWindow3}
    object{ window translate Frontbld1midWindow1}
    object{ window translate Frontbld1midWindow2}
    object{ window translate Frontbld1midWindow3}
    
    rotate <0,1,0>*180
    translate <11,0.1,-10.3>
}
//--------------------------------------------------------------------------------------------------- Front Building 1 END

//--------------------------------------------------------------------------------------------------- Front Building 2 START
union{
    difference{
        box { < 0,0,0 >,< FrontBld2Heightx,FrontBld2Heighty,FrontBld2Heightz >   
              texture { pigment{ color rgb< 0.0, 0.9, 0.5>*1.4  }   
                   finish { phong 1 reflection 0.00}
                 }  
            }
        box { 
              < wallThickness,0.10,wallThickness >,
              <FrontBld2Heightx-wallThickness,FrontBld2Heighty-wallThickness,FrontBld2Heightz-wallThickness>  
              texture { wallTexture2 }  
            }
        object{ windowHole translate Frontbld2topWindow1}
        object{ windowHole translate Frontbld2topWindow2}
        object{ windowHole translate Frontbld2topWindow3} 
        object{ windowHole translate Frontbld2midWindow1}
        object{ windowHole translate Frontbld2midWindow2}
        object{ windowHole translate Frontbld2midWindow3}
    }
    
    object{ window translate Frontbld2topWindow1}
    object{ window translate Frontbld2topWindow2}
    object{ window translate Frontbld2topWindow3}
    object{ window translate Frontbld2midWindow1}
    object{ window translate Frontbld2midWindow2}
    object{ window translate Frontbld2midWindow3}
    
    rotate <0,1,0>*180
    translate <-6,0.1,-10.3>
}
//--------------------------------------------------------------------------------------------------- Front Building 2 END
                           
#declare streetTexture =                            
    texture{   pigment{ color rgb<1,1,1>*0.3}
               normal { bumps 0.09 scale 0.0005}
               finish { diffuse 0.9 phong 0.1}
           }
            
//--------------------------------------------------------------------------------------------------- Start Street
box{ 
    <-1000.00,0.00,-1.50>,<1000.00,0.0001,-5.50>
    texture { streetTexture }    
}
//--------------------------------------------------------------------------------------------------- End Street

//--------------------------------------------------------------------------------------------------- Start Zebra Crossing
box{
    <-1.00,0.00,-1.50>,<1.00,0.0002,-5.50>
         texture{  
            pigment{
                     gradient z
                     color_map {
                        [0.0 color rgb <1.00, 1.00, 1.00>]
                        [0.5 color rgb <1.00, 1.00, 1.00>]
                        [0.5 color rgb <1.00,1.00,1.00>*0.3]
                        [1.0 color rgb <1.00,1.00,1.00>*0.3]
                     }
                   } 
        }

}
//--------------------------------------------------------------------------------------------------- End Zebra Crossing 

//--------------------------------------------------------------------------------------------------- Start PavementFar
box{ 
    <-1000.00,0.00,50.50>,<1000.00,0.1,-1.50>
     texture{ pigment{ color rgb< 1, 1, 1>*0.85 }
                   finish { phong 1 reflection 0.00}
                 }    
}
//--------------------------------------------------------------------------------------------------- End PavementFar

//--------------------------------------------------------------------------------------------------- Start PavementNear
box{ 
    <-1000.00,0.00,-5.50>,<1000.00,0.1,-50.50>
    texture{ pigment{ color rgb< 1, 1, 1>*0.85 }
                   finish { phong 1 reflection 0.00}
                 } 
  
}
//--------------------------------------------------------------------------------------------------- End PavementNear

//--------------------------------------------------------------------------------------------------- Start Tree1
#declare Tree1 = 
    union{
        cylinder { <0,0,0>,<0,0.60,0>, 0.09 
               texture{ // ----------------------------------------   
                pigment{ wood turbulence 0.02 octaves 4 lambda 3
                         scale 0.175 rotate <2, 3, 0> 
                         color_map {
                           [0.0 color rgb <1.30, 0.99, 0.64>]
                           [0.5 color rgb <0.75, 0.39, 0.17>]
                           [0.7 color rgb <0.75, 0.39, 0.17>]
                           [1.0 color rgb <1.30, 0.99, 0.64>]
                         }
                       } 
                finish { phong 1 } 
                rotate <0,0, 0>  scale 1  translate <0,0,0>
            }
             }
        cone { <0,0,0>,0.75,<0,1.50,0>,0 
    
           texture { pigment{ color rgb< 0.0, 1.0, 0.5>*0.5 }
                     normal { bumps 1.5 scale 0.05 }
                       finish { phong 1 reflection 0.00}
                     } 
    
    
           scale <1,1,1> rotate<0,0,0> translate<0,0.5,0>         
         } 
    }
//--------------------------------------------------------------------------------------------------- End Tree1

//--------------------------------------------------------------------------------------------------- Start Tree2
#declare Tree2 = 
    union{
        cylinder { <0,0,0>,<0,0.60,0>, 0.09 
               texture{ T_Wood29    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              }
             }
        sphere { <0,0,0>, 1.00 
         texture { pigment{ color rgb<0.35,0.65,0.0>*0.9} }                                     
                   normal { bumps 1.75 scale 0.05} 
                   finish { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                 } 
          scale<0.5,0.5,0.5>  rotate<0,0,0>  translate<0,1,0>  
       }
    
//--------------------------------------------------------------------------------------------------- End Tree2
object { Tree1 translate <6,0.1,-1>}
object { Tree2 translate <-3,0.1,-1>}
object { Tree2 scale <0.5,0.5,0.5> translate <-2.7,0.1,-1.3>}         

//--------------------------------------------------------------------------------------------------- Start Big Donut
#macro bounce(X)
    #if(X<0.5) (sin(pi*(X+0.5)))
    #else (sin(pi*(1-X+0.5)))
    #end
#end

#declare bigDonut=
union{
    torus { 0.35,0.15 
            texture { pigment{ rgb< 0.75, 0.5, 0.30>*0.5 }
                      finish { phong 0.4 }
                      normal { bumps 0.5 scale 0.15}
                    }
            scale <1,1,1>*1.5 rotate<90,0,0> translate<0,0,0>
    }            
    
    object{              
       Circle_Text("cyrvetic.ttf","DONUT",0.5 ,0.01,0.01,1.15,1,Align_Center,-90 ) 
            texture{ pigment{ color rgb<1.0, 0.4, 0.75> }   
                   }
            rotate<0,0,0>
            scale<1,1,1>*0.5 
            translate<0.0,0.2,-0.25>
          }
    object{              
       Circle_Text("cyrvetic.ttf","THE BIG",0.5 ,0.01,0.01,1.15,0,Align_Center,90 ) 
            texture{ pigment{ color rgb<1.0, 0.4, 0.75> }   
                   }
            rotate<0,0, 0>
            scale<1,1,1>*0.5 
            translate<0.0,-0.2,-0.25>
          }
}

object{bigDonut
       rotate <0,0,360*clock>
       translate <-1,0.65,-5>
       translate <-3*clock,bounce(clock),0>
      }

//--------------------------------------------------------------------------------------------------- End Big Donut

//--------------------------------------------------------------------------------------------------- Start Truck
#declare Rim_Texture = 
 texture{ Polished_Chrome }

#declare Tire_Texture = 
 texture { pigment{color rgb<1,1,1>*0.1}}

#declare Tread_Texture = 
  texture{ pigment{color rgb<1,1,1>*0.1}
           normal { bumps 0.5 scale 0.01}
         }

//---------------------------------------------------------------------------------------------- Start Wheel
#declare wheel =
union{
intersection{
//---------------------------------------------------------------------------------------------- Start tire         
    union{
       torus{ 0.3 , 0.1 rotate<90,0,0> translate<0,0,0.05> }
       torus{ 0.3 , 0.1 rotate<90,0,0> translate<0,0,-0.05> }
       difference{
            cylinder{<0,0,-0.14>,<0,0,0.14>,0.40 }
            cylinder{<0,0,-0.15>,<0,0,0.15>,0.30}
       }
    }     
//---------------------------------------------------------------------------------------------- End tire

//---------------------------------------------------------------------------------------------- Start tire thread
    torus { 0.4001, 0.02 inverse rotate<90,0,0> scale <1,1,0.3> translate<0,0,-1*0.035>} //
    torus { 0.4001, 0.01 inverse rotate<90,0,0> scale <1,1,0.3> translate<0,0,-0*0.035>} //
    torus { 0.4001, 0.02 inverse rotate<90,0,0> scale <1,1,0.3> translate<0,0, 1*0.035>} //
    
    #declare Start = 0; 
    #declare End = 20;
      
    #while (Start<End) 
    union{ //2
       cylinder{<0,0,-0.2>,<0,0,-0.02>,0.02 scale <0.4,2,1> translate<0.05,0.4,0> }
       cylinder{<0,0,0.02>,<0,0,0.2>,0.02 scale <0.4,2,1> translate<0.05,0.4,0> }
       rotate<0,0,Start*18>  
       inverse
    } 
    #declare Start = Start + 1; 
    #end
//---------------------------------------------------------------------------------------------- End tire thread
    texture {Tire_Texture }
}
//---------------------------------------------------------------------------------------------- Start rim 
union{ 
    torus { 0.25, 0.08 rotate<90,0,0> scale <1,1,1.5> }
    sphere {<0,0,0>,0.05 scale<1,1,0.5>translate<0,0,-0.1>}
     
    #declare Start = 0; 
    #declare End = 20;
    
    #while (Start<End)
    union{
        cone{<0,0,0>,0.01,<0.3,0,-0.01>,0.06 scale <1,1,0.3> rotate<30,0,0> translate<0,0,-0.07> }
        rotate<0,0,Start*36>   
        inverse
    }
    #declare Start = Start + 1; 
    #end 
    texture { Rim_Texture } 
 }
//---------------------------------------------------------------------------------------------- Start rim
rotate<0,0,-1>*(720*clock)
translate <0,0.4,0>              
}
//---------------------------------------------------------------------------------------------- End Wheel

#declare frontWheels =
union{
    object{ wheel translate <0,0,0> }
    object{ wheel translate <0,0,-2> }
    }
    
#declare backWheels =
union{
    object{ wheel translate <0,0,0> }
    object{ wheel translate <0,0,-0.4> }
    object{ wheel translate <0,0,-2.0> }
    object{ wheel translate <0,0,-1.6> }
    }

#declare frontChassis =
union{    
    object{frontWheels}
    object{backWheels translate <-2.5,0,0> }
    box{ <0,0.25,-0.5>,<-2.5,0.85,-1.5> pigment{rgb<0.2,0.2,0.2>}}   
    }
    
#declare backChassis =
union{    
    object{backWheels translate <-8,0,0> }
    object{backWheels translate <-6,0,0> }
    box{ <-4,0.25,-0.5>,<-8,0.85,-1.5> pigment{rgb<0.2,0.2,0.2>}}   
    }

//---------------------------------------------------------------------------------------------- Start Body
#declare frontbody =
union{
    difference{  
        union{
            object{ Round_Box(
                     <-1.60,0,-1.10>,
                     <0.80,1.10,1.10>,0.15,0)  
                  }
            object{ Round_Box(
                     <-1.60,0.01,-1.10>,
                     <-0.60,2.00,1.10>,0.15,0)  
                  }
            pigment{rgb<0.7,0.7,0.7>}
        }
        object{ Round_Box(
                 <-1.45,1.10,-1.11>,
                 <-0.75,1.85, 1.11>,0.15,0)   
              }  
        object{ Round_Box(
                 <-1.50,1.20,-0.95>,
                 <-0.30,1.85,0.95>,0.15,0)  
              }
        object{ Round_Box(
             <-1.55,0.05,-1.05>,
             <-0.65,1.95, 1.05>,0.15,0)  
              
          }
        cylinder{ <0,0,-1.11>,
                  <0,0,1.11>, 0.60 
                }
        pigment{rgb<0.7,0.7,0.7>}
    }
    object{ Round_Box(
                 <-0.65,1.20,-0.95>,
                 <-0.64,1.85,0.95>,0.0,0)  
              texture{ pigment { rgb <1.0,1.0,1.0> filter 0.8 }
                       finish {reflection 0.2}}
              }
    object{ Round_Box(
             <-1.55,0.05,-1.05>,
             <-0.65,1.95, 1.05>,0.0,0)      
             texture{ pigment { rgb <1.0,1.0,1.0> filter 0.8 }
                      finish {reflection 0.2}}
           }
    scale <1,1,1>*0.9
    translate <0,0.4,-1>
} 

#declare backbody =
union{
    object{ Round_Box(
          <-9,0,-1.10>,
          <-2,2.10,1.10>,0.15,0)
          pigment{rgb<0.7,0.7,0.7>}
          translate <0,0.8,-1>  
       }
    box{<-3,0.5,1.10>,<-7,2.05,1.11>
        pigment { image_map { gif "zootopiaBigDonut.gif" map_type 0} scale <1.5,0.6,0>*2.8 rotate <0,1,0>*180 translate <1.2,0.5,0>}
        translate <-0.1,0.65,0>
        }
}       

#declare truckLights1 =
union{
object{
        Round_Box(<-1,0,0>,<1,1,0.2>, 0.25   , 0)  
        texture{ pigment{ color rgb< 1.0, 1.0, 0.6>}
                 finish { ambient 1 }
                }
        scale<1,1,1>*0.2  
        rotate<0,90,0> 
      }
      light_source {
        <1.1,0.5,0.1>
        color  Yellow
        spotlight
        radius 10
        falloff 2
        tightness 4 
        point_at <3,0,0.15>
    }
} 

#declare truckLights2 =
union{
object{
        Round_Box(<-1,0,0>,<1,1,0.2>, 0.25   , 0)  
        texture{ pigment{ color rgb< 1.0, 1.0, 0.6>}
                 finish { ambient 1 }
                }
        scale<1,1,1>*0.2  
        rotate<0,90,0> 
      }
      light_source {
        <1.1,0.5,0.1>
        color  Yellow
        spotlight
        radius 10
        falloff 2
        tightness 4 
        point_at <3,0,0.0>
    }
} 
        
//---------------------------------------------------------------------------------------------- End Body
#declare truck =
union{
    object{frontChassis} 
    object{backChassis}
    object{frontbody}
    object{backbody}
    object{truckLights1 translate <0.68,0.75,-0.5>}
    object{truckLights2 translate <0.68,0.75,-1.5>}
} 

object{truck
       scale <1,1,1>*0.6
       rotate <0,1,0>*180
       translate <1,0,-3.5>
       translate <-5,0,0>*clock
       }
//--------------------------------------------------------------------------------------------------- End Truck

//--------------------------------------------------------------------------------------------------- Start Lamp post
#declare lampost=
union{
    intersection{
    
      box{ <-2.5,-2.0,-2.5>,<2.5, 2.00,2.5> } 
      object{ Hyperboloid_Y }
       
      texture { pigment{ color rgb<1.0, 1.0, 0.0> }
                finish { phong 0.1 }
              }
      scale <1,0,1>*0.25 rotate<0,0,0> translate<0,2,0.0>
    }
    
    
    object{ Segment_of_Torus ( 1.10, 
                               0.25, 
                               -270
                             )
            texture { pigment{ color rgb<1,0.7,0>}  
                      finish { phong 1}
                    }
            scale <1,1,1> rotate<90,0,0> translate<0,4,0>
          }              
     
    intersection{
    
      box{ <-2.5,-2.0,-2.5>,<2.5, 2.00,2.5> } 
      object{ Hyperboloid_Y }
       
      texture { pigment{ color rgb<1.0, 1.0, 0.0> }
                finish { phong 0.1 }
              }
      scale <1,0,1>*0.25 rotate<0,0,0> translate<0,4,0.0>
    }
    
    
    object{ Rounded_Tube( 1.50,
                          0.80, 
                          0.10,
                          0.70,
                          1,
                        ) 
            texture{ pigment{ color rgbt<1 ,1,1,0.5> } 
                     finish { ambient 1}                               
                   }
            scale <1,1,1>*0.38 
            rotate<0,0,0> 
            translate<0,6,0>
          }
/*     light_source {
      <0,4.5,0>             
      color Yellow      
      spotlight
      radius 100
      falloff 15
      tightness 8
      area_light
      <1, 0, 0> <0, 0, 1> 
      10, 10                
      adaptive 10          
      jitter              
      circular            
      orient              
      translate <0, 0, 0>   
     }   */                    
    
} 

object{lampost
       scale <1,1,1>*0.35
       scale <1,0,1>*0.8
       translate <-2.6,0.1,-6>
     }
object{lampost
       scale <1,1,1>*0.35
       scale <1,0,1>*0.8
       translate <-2.5,0.1,2.5>
     }


//--------------------------------------------------------------------------------------------------- End Lamp Post

//--------------------------------------------------------------------------------------------------- Start Fire Hydrant
#declare fireHydrant=
union{
    cylinder { <0,0,0>,<0,2.00,0>, 0.32 

             texture{ pigment{ color rgb<1, 0.0, 0.0>}
                normal { pigment_pattern{
                            average pigment_map{[0.1, gradient x sine_wave]
                                                [0.1, gradient x scallop_wave]}
                                         translate 0.02 scale 1}
                                         5
                         rotate< 0,0,0> scale 0.15 }
                finish { specular 0.3 reflection{ 0.0 } }
              } 
              

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
         }

    intersection { 
     box{ <-2,-2.5,0>,<2.5,2.5, 4.00> }
     object{ Paraboloid_Z}  
             texture{ pigment{ color rgb<1, 0.0, 0.0>}
                normal { pigment_pattern{
                            average pigment_map{[0.1, gradient z sine_wave]
                                                [0.1, gradient z scallop_wave]}
                                         translate 0.02 scale 1}
                                         5
                         rotate< 0,0,0> scale 0.15 }
                finish { specular 0.3 reflection{ 0.0 } }
              }
            scale <1,1,1>*0.25 rotate<90,0,0> translate<0.0,2.5,0.0>
           }
    intersection { 
     box{ <-2,-2.5,0>,<2.5,2.5, 4.00> }
     object{ Paraboloid_Z}  
             texture{ pigment{ color rgb<1, 0.0, 0.0>}
                normal { pigment_pattern{
                            average pigment_map{[0.1, gradient y sine_wave]
                                                [0.1, gradient y scallop_wave]}
                                         translate 0.02 scale 1}
                                         5
                         rotate< 0,0,0> scale 0.15 }
                finish { specular 0.3 reflection{ 0.0 } }
              }
            scale <1,1,1>*0.15 rotate<90,0,90> translate<-0.5,1.2,0.0>
           }
    intersection { 
     box{ <-2,-2.5,0>,<2.5,2.5, 4.00> }
     object{ Paraboloid_Z}  
             texture{ pigment{ color rgb<1, 0.0, 0.0>}
                normal { pigment_pattern{
                            average pigment_map{[0.1, gradient y sine_wave]
                                                [0.1, gradient y scallop_wave]}
                                         translate 0.02 scale 1}
                                         5
                         rotate< 0,0,0> scale 0.15 }
                finish { specular 0.3 reflection{ 0.0 } }
              }
            scale <1,1,1>*0.15 rotate<90,0,-90> translate<0.5,1.2,0.0>
           }   
}

object{fireHydrant
       scale <1,1,1>*0.2
       translate <-5.0,0.1,-1>
       }
//--------------------------------------------------------------------------------------------------- End Fire Hydrant

//--------------------------------------------------------------------------------------------------- Start Water Fountain
#declare waterFountain=
union{
//--------------------------------------------------------------------------------------------------- Start Water Fountain Base
union{
    difference{
        cylinder{<0,0,0>,<0,1,0>,3 }
        cylinder{<0,0.05,0>,<0,1.1,0>,2.9}
    }
           texture{ T_Stone15    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              }
}
//--------------------------------------------------------------------------------------------------- End Water Fountain Base 

//--------------------------------------------------------------------------------------------------- Start Water Fountain Stand

union{
    sphere { <0,3,0>, 0.2 }
    cylinder{ <0,0.05,0>,<0,3,0>,0.3 }
    cylinder{ <0,0.05,0>,<0,2.0,0>,0.6 }
    cylinder{ <0,0.05,0>,<0,1.0,0>,1.0 }
    texture{ T_Stone15    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              }
}
//--------------------------------------------------------------------------------------------------- End Water Fountain Stand

//--------------------------------------------------------------------------------------------------- Start Water Fountain Stand Water
sphere { <0,3.1,0>, 0.2 

        texture{
          pigment{ rgbf<.93,.95,.96,0.9>*0.95}
          normal { ripples 1.35 scale 0.05 turbulence 0.3 translate<-0.05,0,0> rotate<0,-20,0>}
          finish { ambient 0.0
                   diffuse 0.15
                   reflection 0.2
                   specular 0.6
                   roughness 0.005
                   reflection { 0.2, 1.0 fresnel on }
                   conserve_energy
                 }
           }
         
          interior{ ior 1.33 
                    fade_power 1001
                    fade_distance 0.5
                    fade_color <0.8,0.8,0.8> 
                }  
       }
           
union{
    cylinder{ <0,3,0>,<0,3.01,0>,0.301 }
    cylinder{ <0,2,0>,<0,2.01,0>,0.601 }
    cylinder{ <0,1,0>,<0,1.01,0>,1.01 }
    texture{
          pigment{ rgbf<.93,.95,.96,0.9>*0.95}
          normal { ripples 1.35 scale 0.075 turbulence 0.1 translate<-0.05,0,0> rotate<0,-20,0>}
          finish { ambient 0.0
                   diffuse 0.15
                   reflection 0.2
                   specular 0.6
                   roughness 0.005
                   reflection { 0.2, 1.0 fresnel on }
                   conserve_energy
                 }
           }
         
          interior{ ior 1.33 
                    fade_power 1001
                    fade_distance 0.5
                    fade_color <0.8,0.8,0.8> 
                }
}

union{
    cylinder{ <0,0,0>,<0,3.0,0>,0.301 }
    cylinder{ <0,0,0>,<0,2.0,0>,0.601 }
    cylinder{ <0,0,0>,<0,1.0,0>,1.01 }
    texture{
          pigment{ rgbf<.93,.95,.96,0.9>*0.95}
          normal { ripples 1.35 scale 1.75 turbulence 0.8 translate<-0.05,0,0> rotate<0,-20,0>}
          finish { ambient 0.0
                   diffuse 0.15
                   reflection 0.2
                   specular 0.6
                   roughness 0.005
                   reflection { 0.2, 1.0 fresnel on }
                   conserve_energy
                 }
           }
         
          interior{ ior 1.33 
                    fade_power 1001
                    fade_distance 0.5
                    fade_color <0.8,0.8,0.8> 
                }
}
//--------------------------------------------------------------------------------------------------- Start Water Fountain Stand Water

//--------------------------------------------------------------------------------------------------- Start Water Fountain Water
intersection{ 
 cylinder{<0,0.051,0>,<0,0.70,0>,2.9 }
 cylinder{<0,0.052,0>,<0,0.71,0>,2.9 }
        texture{
          pigment{ rgbf<.93,.95,.96,0.9>*0.95}
          normal { ripples 1.35 scale 0.125 turbulence 0.3 translate<-0.05,0,0> rotate<0,-20,0>} 
          finish { ambient 0.0
                   diffuse 0.15
                   reflection 0.2
                   specular 0.6
                   roughness 0.005
                   reflection { 0.2, 1.0 fresnel on }
                   conserve_energy
                 }
           }
         
          interior{ ior 1.33 
                    fade_power 1001
                    fade_distance 0.5
                    fade_color <0.8,0.8,0.8> 
                }          
 }
//--------------------------------------------------------------------------------------------------- End Water Fountain Water
}
object{waterFountain
       scale <1,1,1>*0.4
       translate<0.2,0.1,1.5>
      }
//--------------------------------------------------------------------------------------------------- End Water Fountain

//--------------------------------------------------------------------------------------------------- Start Bench
#declare bench =
union{
#declare Rhomboid =
 object{ Rhomboid  
        texture{ pigment{ color rgb<0.0,0.2,0.2> }
                 finish { phong 1 }
               }
        scale <1,1,1>*0.1
        scale <0,0,1>*30
       }
#declare X = -1; 
#declare End_X = 1; 
#while ( X <= End_X )
 object{ Rhomboid translate < X, 0.5, 0> }
#declare X = X + 0.35; 
#end 


#declare Y = 0.5; 
#declare End_Y = 2;
#while ( Y <= End_Y )
 object{ Rhomboid translate < 1.15, Y, 0> }
#declare Y = Y + 0.25;
#end


sphere_sweep {
    linear_spline
    4,
    <-0.50, 1.00, 0>, 0.25
    <-0.50, 0.00, 0>, 0.15
    < 0.50, 0.00, 0>, 0.25
    < 0.50, 1.00, 0>, 0.15

    texture{ pigment{ color rgb<1,0.15,0.00>}
             finish { phong 1 }
           } 
    
    scale<1.5,1.5,1>*0.7   rotate<180,0,0>  translate<0,1.2,2.9>  
} 
sphere_sweep {
    linear_spline
    4,
    <-0.50, 1.00, 0>, 0.25
    <-0.50, 0.00, 0>, 0.15
    < 0.50, 0.00, 0>, 0.25
    < 0.50, 1.00, 0>, 0.15

    texture{ pigment{ color rgb<1,0.15,0.00>}
             finish { phong 1 }
           }
    
    scale<1.5,1.5,1>*0.7   rotate<180,0,0>  translate<0,1.2,-2.9>  
}  


object{ Hexagon  
        texture{ pigment{ color rgb<1,1,1> }
                 finish { phong 1 }
               }
        rotate<0,0,90>
        scale <1,8,1>*0.1 
        translate <1.2,1.3,1.5>
      }
object{ Hexagon  
        texture{ pigment{ color rgb<1,1,1> }
                 finish { phong 1 }
               }
        rotate<0,0,90>
        scale <1,8,1>*0.1 
        translate <1.2,1.3,-1.5>
      }
object{ Hexagon  
        texture{ pigment{ color rgb<1,1,1> }
                 finish { phong 1 }
               }
        scale <9,1,1>*0.1 
        translate <0,0.4,1.5>
      }
object{ Hexagon  
        texture{ pigment{ color rgb<1,1,1> }
                 finish { phong 1 }
               }
        scale <9,1,1>*0.1 
        translate <0,0.4,-1.5>
      }
}

object{bench
       scale <1,1,1>*0.3
       rotate <0,180,0>
       translate <-2.5,0.1,1.5>
       }
//--------------------------------------------------------------------------------------------------- End Bench


