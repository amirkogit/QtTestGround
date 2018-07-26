# Sample application that uses 'pydicom' to read DICOM files. The application allows the user to browse the folder
# where DICOM files are located. Once the directory is set, all DICOM files that are currently present in the folder are
# displayed in a tabular format. Double clicking on each file will display a new dialog box that contains the DICOM
# header information. Currently, all top level Dataset retrieved from pydicom are displayed (without sequences). So, all
# fields may not be visible in a dialog box as the scroll bar is absent.

import pydicom
from PySide2 import QtCore, QtWidgets

class Window(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super(Window, self).__init__(parent)

        self.browseButton = self.createButton("&Browse...", self.browse)
        self.directoryComboBox = self.createComboBox(QtCore.QDir.currentPath())

        directoryLabel = QtWidgets.QLabel("In directory:")
        self.filesFoundLabel = QtWidgets.QLabel()

        self.createFilesTable()

        buttonsLayout = QtWidgets.QHBoxLayout()
        buttonsLayout.addStretch()

        mainLayout = QtWidgets.QGridLayout()
        mainLayout.addWidget(directoryLabel, 2, 0)
        mainLayout.addWidget(self.directoryComboBox, 2, 1)
        mainLayout.addWidget(self.browseButton, 2, 2)
        mainLayout.addWidget(self.filesTable, 3, 0, 1, 3)
        mainLayout.addWidget(self.filesFoundLabel, 4, 0)
        mainLayout.addLayout(buttonsLayout, 5, 0, 1, 3)
        self.setLayout(mainLayout)

        self.setWindowTitle("Explore DICOM Files")
        self.resize(1200, 800)

    def browse(self):
        directory = QtWidgets.QFileDialog.getExistingDirectory(self, "Find Files",
                QtCore.QDir.currentPath())

        if directory:
            if self.directoryComboBox.findText(directory) == -1:
                self.directoryComboBox.addItem(directory)

            self.directoryComboBox.setCurrentIndex(self.directoryComboBox.findText(directory))
            self.find()

    @staticmethod
    def updateComboBox(comboBox):
        if comboBox.findText(comboBox.currentText()) == -1:
            comboBox.addItem(comboBox.currentText())

    def find(self):
        self.filesTable.setRowCount(0)

        path = self.directoryComboBox.currentText()

        self.updateComboBox(self.directoryComboBox)

        self.currentDir = QtCore.QDir(path)
        fileName = "*.dcm"
        files = self.currentDir.entryList([fileName],
                QtCore.QDir.Files | QtCore.QDir.NoSymLinks)

        self.showFiles(files)

    def showFiles(self, files):
        for fn in files:
            file = QtCore.QFile(self.currentDir.absoluteFilePath(fn))
            size = QtCore.QFileInfo(file).size()

            fileNameItem = QtWidgets.QTableWidgetItem(fn)
            fileNameItem.setFlags(fileNameItem.flags() ^ QtCore.Qt.ItemIsEditable)
            sizeItem = QtWidgets.QTableWidgetItem("%d KB" % (int((size + 1023) / 1024)))
            sizeItem.setTextAlignment(QtCore.Qt.AlignVCenter | QtCore.Qt.AlignRight)
            sizeItem.setFlags(sizeItem.flags() ^ QtCore.Qt.ItemIsEditable)

            row = self.filesTable.rowCount()
            self.filesTable.insertRow(row)
            self.filesTable.setItem(row, 0, fileNameItem)
            self.filesTable.setItem(row, 1, sizeItem)

        self.filesFoundLabel.setText("%d file(s) found (Double click on a file to open it)" % len(files))

    def createButton(self, text, member):
        button = QtWidgets.QPushButton(text)
        button.clicked.connect(member)
        return button

    def createComboBox(self, text=""):
        comboBox = QtWidgets.QComboBox()
        comboBox.setEditable(True)
        comboBox.addItem(text)
        comboBox.setSizePolicy(QtWidgets.QSizePolicy.Expanding,
                QtWidgets.QSizePolicy.Preferred)
        return comboBox

    def createFilesTable(self):
        self.filesTable = QtWidgets.QTableWidget(0, 2)
        self.filesTable.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)
        self.filesTable.setHorizontalHeaderLabels(("File Name", "Size"))
        self.filesTable.horizontalHeader().setSectionResizeMode(0, QtWidgets.QHeaderView.Stretch)
        self.filesTable.verticalHeader().hide()
        self.filesTable.setShowGrid(False)
        self.filesTable.cellActivated.connect(self.openFileOfItem)

    def displayDicomInformation(self, msg):
        infoDialog = QtWidgets.QDialog()
        layout = QtWidgets.QGridLayout(infoDialog)
        layout.addWidget(QtWidgets.QLabel(msg))
        infoDialog.setLayout(layout)
        infoDialog.setWindowTitle('Dicom tag information')
        infoDialog.show()
        infoDialog.exec_()

    def openFileOfItem(self, row, column):
        item = self.filesTable.item(row, 0)
        path = self.directoryComboBox.currentText() + "/" + item.text()
        dataset = pydicom.dcmread(path)

        all_tags = ''
        for elem in dataset:
            print(elem)
            tag = str(elem) + '\n'
            all_tags += tag

        self.displayDicomInformation(all_tags)

def run_main():
    import sys
    app = QtWidgets.QApplication(sys.argv)
    window = Window()
    window.showMaximized()
    sys.exit(app.exec_())

if __name__ == '__main__':
    run_main()



