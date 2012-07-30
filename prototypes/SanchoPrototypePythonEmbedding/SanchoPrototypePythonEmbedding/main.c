//
//  main.c
//  SanchoPrototypePythonEmbedding
//
//  Created by 전 수열 on 12. 7. 30..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#include <stdio.h>
#include <Python/Python.h>

int main(int argc, const char * argv[])
{
	const char *pluginDir = "/Users/xoul/workspace/Sancho/prototypes/SanchoPrototypePythonEmbedding/plugins";
	
	// Initialize python interpreter.
	Py_Initialize();
	
	PyObject *sysPath = PySys_GetObject( "path" );
	PyObject *path = PyString_FromString( pluginDir );
	PyList_Insert( sysPath, 0, path );
	
	// Import python moudule named 'helloworld'
	PyObject *module = PyImport_ImportModule( "helloworld" );
	if( PyErr_Occurred() )
		PyErr_Print();
	
	// Get dictionary from module 'helloworld'
	PyObject *dict = PyModule_GetDict( module );
	Py_DECREF( module );
	
	// Get method named 'init' from dictionary.
	PyObject *func = PyDict_GetItemString( dict, "init" );
	
	// Check method from dictionary is callable.
	if( PyCallable_Check( func ) )
	{
		// Arguments are passed as tuple.
		// Make a tuple of length 1.
		PyObject *arguments = PyTuple_New( 1 );
		
		// Set first item to 'Hello'
		PyTuple_SetItem( arguments, 0, PyString_FromString( "Hello" ) );
		
		// Call method with arguments and get return value.
		PyObject *result = PyObject_CallObject( func, arguments );
		Py_DECREF( func );
		Py_DECREF( arguments );
		
		// Print return value as string.
		printf( "%s\n", PyString_AsString( result ) );
		Py_DECREF( result );
	}
	else
	{
		printf( "not callable" );
		PyErr_Print();
	}
	
	// Finalize python interpreter.
	Py_Finalize();
	
	return 0;
}

