# Small demo application that uses QAbstractTableModel to store backend data and display that data
# in a tabular view in a dialog

from PySide2.QtCore import (Qt, Signal, QModelIndex, QAbstractTableModel, QItemSelection, QSortFilterProxyModel)
from PySide2.QtWidgets import (QTableView, QVBoxLayout,QLabel, QAbstractItemView, QDialog)

# Table model that can store name and address fields
class TableModel(QAbstractTableModel):

    def __init__(self, addresses=None, parent=None):
        super(TableModel, self).__init__(parent)

        if addresses is None:
            self.addresses = []
        else:
            self.addresses = addresses

    def rowCount(self, index=QModelIndex()):
        """ Returns the number of rows the model holds. """
        return len(self.addresses)

    def columnCount(self, index=QModelIndex()):
        """ Returns the number of columns the model holds. """
        return 2

    def data(self, index, role=Qt.DisplayRole):
        """ Depending on the index and role given, return data. If not
            returning data, return None (PySide equivalent of QT's
            "invalid QVariant").
        """
        if not index.isValid():
            return None

        if not 0 <= index.row() < len(self.addresses):
            return None

        if role == Qt.DisplayRole:
            name = self.addresses[index.row()]["name"]
            address = self.addresses[index.row()]["address"]

            if index.column() == 0:
                return name
            elif index.column() == 1:
                return address

        return None

    def headerData(self, section, orientation, role=Qt.DisplayRole):
        """ Set the headers to be displayed. """
        if role != Qt.DisplayRole:
            return None

        if orientation == Qt.Horizontal:
            if section == 0:
                return "Name"
            elif section == 1:
                return "Address"

        return None

    def insertRows(self, position, rows=1, index=QModelIndex()):
        """ Insert a row into the model. """
        self.beginInsertRows(QModelIndex(), position, position + rows - 1)

        for row in range(rows):
            self.addresses.insert(position + row, {"name":"", "address":""})

        self.endInsertRows()
        return True

    def removeRows(self, position, rows=1, index=QModelIndex()):
        """ Remove a row from the model. """
        self.beginRemoveRows(QModelIndex(), position, position + rows - 1)

        del self.addresses[position:position+rows]

        self.endRemoveRows()
        return True

    def setData(self, index, value, role=Qt.EditRole):
        """ Adjust the data (set it to <value>) depending on the given
            index and role.
        """
        if role != Qt.EditRole:
            return False

        if index.isValid() and 0 <= index.row() < len(self.addresses):
            address = self.addresses[index.row()]
            if index.column() == 0:
                address["name"] = value
            elif index.column() == 1:
                address["address"] = value
            else:
                return False

            self.dataChanged.emit(index, index, 0)
            return True

        return False

    def flags(self, index):
        """ Set the item flags at the given index. Seems like we're
            implementing this function just to see how it's done, as we
            manually adjust each tableView to have NoEditTriggers.
        """
        if not index.isValid():
            return Qt.ItemIsEnabled
        return Qt.ItemFlags(QAbstractTableModel.flags(self, index) |
                            Qt.ItemIsEditable)


# Address widget dialog that displays name and address data in a tabular format
class AddressWidget(QDialog):

    selectionChanged = Signal(QItemSelection)

    def __init__(self, parent=None):
        super(AddressWidget, self).__init__(parent)

        self.tableModel = TableModel()
        self.tableView = QTableView()
        self.setupTable()

        statusLabel = QLabel("Tabular data view demo")

        layout = QVBoxLayout()
        layout.addWidget(self.tableView)
        layout.addWidget(statusLabel)
        self.setLayout(layout)
        self.setWindowTitle("Address Book")
        self.resize(800,500)

        # add test data
        self.populateTestData()

    def setupTable(self):
        proxyModel = QSortFilterProxyModel(self)
        proxyModel.setSourceModel(self.tableModel)
        proxyModel.setDynamicSortFilter(True)

        self.tableView.setModel(proxyModel)
        self.tableView.setSortingEnabled(True)
        self.tableView.setSelectionBehavior(QAbstractItemView.SelectRows)
        self.tableView.horizontalHeader().setStretchLastSection(True)
        self.tableView.verticalHeader().hide()
        self.tableView.setEditTriggers(QAbstractItemView.NoEditTriggers)
        self.tableView.setSelectionMode(QAbstractItemView.SingleSelection)

        proxyModel.setFilterKeyColumn(0)  # Filter on the "name" column
        proxyModel.sort(0, Qt.AscendingOrder)
        viewselectionmodel = self.tableView.selectionModel()
        self.tableView.selectionModel().selectionChanged.connect(self.selectionChanged)



    def populateTestData(self):
        addresses = [{"name": "John Doe", "address": "Alameda"},
                     {"name": "Alan Turing", "address": "San Deigo"},
                     {"name": "Bjarne Stroutsup", "address": "Columbia"},
                     {"name": "Herb Sutter", "address": "Seattle"},
                     {"name": "Micheal Konin", "address": "Colorado"}]

        for i in range(len(addresses)):
            self.tableModel.insertRows(0)
            ix = self.tableModel.index(0, 0, QModelIndex())
            self.tableModel.setData(ix, addresses[i]["name"], Qt.EditRole)

            ix = self.tableModel.index(0, 1, QModelIndex())
            self.tableModel.setData(ix, addresses[i]["address"], Qt.EditRole)

            self.tableView.resizeRowToContents(ix.row())

def run_main():
    import sys
    from PySide2.QtWidgets import QApplication
    app = QApplication(sys.argv)
    mw = AddressWidget()
    mw.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    run_main()