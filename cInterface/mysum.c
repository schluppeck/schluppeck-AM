#ifdef documentation
=========================================================================

  program: mysum.c
  purpose: show simple use of mex / c function building
           function that checks for a single numeric argument
           and returns the sum across all elements.
  
  by: denis schluppeck, 2017-06-01
  
=========================================================================
#endif

/*=================================================================
 * mysum.c
 *
 * This example demonstrates how to use mexFunction. Based on TMW
 * example mexfunction.c
 *
 * # the resulting function will be called |mysum|
 * # only accepts *one input argument*, return an error otherwise
 * # checks that the input argument is numeric, return an error otherwise
 * # returns the sum of all the values in the input as a single number
 
 * This is a MEX-file for MATLAB.  
 *=================================================================*/
          
#include "mex.h"
#include <string.h>  // strcmp and related


void cumulativeSum(double *in, double *out, mwSize n)
{
  mwSize i;
  
  for (i=0; i<n; i++) {
    out[0] += in[i];
    mexPrintf("iteration %d/%d, value = %.2f\n", i+1,n, out[0]);
  }
}
          
void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
    mwSize  nElements;
    mwSize i;
    double *inMatrix;
    double *outMatrix; 
 
    /* Examine input (right-hand-side) arguments. */
    if (nrhs > 1) {
       mexErrMsgIdAndTxt( "MATLAB:mexfunction:wrongNumberOfInputArgs",
              "This function expects a single input.\n");
    }
    
    
    /* now check type of input arg */
    mexPrintf("\nInput Arg is of type:\t%s ", mxGetClassName(prhs[0]));
    if ( mxIsDouble(prhs[0]) )
        mexPrintf("\nAll good...\n");
    else
        mexPrintf("\n\tNot good at all...\n\n");
 
    // get info about size # of elements
    nElements = mxGetNumberOfElements(prhs[0]);
    mexPrintf("\n# of elements in input arg: %d\n\n", nElements); 
    
    // get the actual input data
    inMatrix = mxGetPr(prhs[0]);
    
    // create the output matrix (actually a scalar
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);

    // get a pointer to the real data in the output matrix 
    outMatrix = mxGetPr(plhs[0]);
        
    // compute in separate routoine and pass into output arg:
    cumulativeSum(inMatrix, outMatrix, nElements);
    
    
}

