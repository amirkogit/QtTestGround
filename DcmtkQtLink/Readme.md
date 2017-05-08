# DcmtkQtLink
DcmtkQtLink is a console based application developed using Qt and C++. It demonstrates how to link a third party libraries in Qt projects. 
It uses DCMTK library which is a widely used library to work with DICOM images (http://dicom.offis.de/index.php.en).

# Required Tools
Following tools are required to build this project

1. Qt Creator (version used - 3.6.0) Website: https://www.qt.io/developers/
2. DCMTK library files and DLL Website: http://dicom.offis.de/index.php.en

Note that DCMTK library has been compiled already using instructions mentioned in DCMTK site and this repository contains only the precompiled library files, DLL files and necessary header includes.

# Project Structure
## main.cpp
Main program entry.

## MyQtApp
Contains qmake project file descriptions.

## resources
Contains a test DICOM file to be used in the project.

## thirdparty
Contains pre-compiled DCMTK lib, dll and include header files.

## bin
Initially this folder is empty, but after you build and run the project, executables will be saved inside this folder under selected build configuration, that is debug and release.
Also, the necessary dll files and test files will be copied to the folder where .exe file is created. This has been done as a post build step in qmake. (See section on Building the project for more information on how to setup this)

# Building the project
1. Simply open MyQtApp.pro file in the Qt Creator IDE.
2. In the mode selector, select "Projects". In "Edit build configuration", select the build configuration mode. In the "Build directory" select "Browse" to navigate to the application code folder. For eg: C:\qt\DcmtkQtLink
3. In the "Build Steps", click "Add Build Step". This will bring a form with default values. Leave the default values and enter "install" in the "Make arguments:". This step will make sure that the necessary lib and Dll files are copied to the folder where .exe file is generated.
4. Select "Build" and "Run qmake".
5. Click "Build" button to build the project.
6. Click "Run" button to run the project.

