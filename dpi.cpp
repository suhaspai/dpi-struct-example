// DPI C codde
#include <iostream>
#include <string.h>
#include "svdpi.h"

typedef struct 
{
   int          control;
   int          data;
   char         b;
   short        h;
   svBitVecVal  intr;
} dpi_struct_t;

dpi_struct_t sv_copy;             

extern "C" void  dpi_input(const dpi_struct_t *sv)
{
   memcpy(&sv_copy, sv, sizeof(dpi_struct_t));
   
   printf("\nHello from C DPI function!\n");
   printf("sizeof(dpi_struct_t)=%lu\n", sizeof(dpi_struct_t));
   printf("NOTE: PRINTING INDIV FIELDS DO NOT MATCH WITH SV\n");
   printf("control=%08x data=%08x b=%02x h=%04x intr=%02x\n",
          sv_copy.control, sv_copy.data, sv_copy.b, sv_copy.h, sv_copy.intr);
} 

extern "C" void  dpi_output(dpi_struct_t *c)
{
   memcpy(c, &sv_copy, sizeof(sv_copy) );   
}   
