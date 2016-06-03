/*
* This is a small demo application to demonstrate how to link third
* party library(DCMTK) in QT project(console based).
* Copyright (C) 2016  Amir Shrestha
* amirkomail@gmail.com
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include <QCoreApplication>
#include <QDebug>

// DCMTK includes
#include <dcmtk/dcmdata/dcfilefo.h>
#include <dcmtk/dcmdata/dcdeftag.h>

// STL includes
#include <memory>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    qDebug() << "**********************************************\n";
    qDebug() << "Demo - linking DCMTK library to QT project";
    qDebug() << "**********************************************\n";

    // get the test data to load
    QString test_data_file_name = "/dicom_testdata.dcm";
    QString test_data_file_path = QCoreApplication::applicationDirPath() + test_data_file_name;

    qDebug() << "\nTest data file path: \n" << test_data_file_path << "\n";

    DcmFileFormat file_format;
    OFCondition status = file_format.loadFile(test_data_file_path.toStdString().c_str());
    std::shared_ptr<DcmDataset> dataset(file_format.getDataset());

    qDebug() << "\nInformation extracted from DICOM file: \n";

    const char* buffer = nullptr;
    DcmTagKey key = DCM_PatientName;
    dataset->findAndGetString(key,buffer);
    std::string tag_value = buffer;
    qDebug() << "Patient name: " << tag_value.c_str();

    key = DCM_PatientID;
    dataset->findAndGetString(key,buffer);
    tag_value = buffer;
    qDebug() << "Patient id: " << tag_value.c_str();

    key = DCM_TransferSyntaxUID;
    dataset->findAndGetString(key,buffer);
    if(buffer == NULL) {
        qDebug() << "Transfer syntax value is NULL";;
    }
    else {
        tag_value = buffer;
        qDebug() << "Transfer syntax: " << tag_value.c_str();
    }

    E_TransferSyntax transfer_syntax = dataset->getCurrentXfer();
    DcmXfer dcm_ts(transfer_syntax);
    std::string ts_name = dcm_ts.getXferName();
    qDebug() << "Transfer syntax name: " << ts_name.c_str();

    return app.exec();
}
