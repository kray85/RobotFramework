function deleteRow(button) {
    // Get the row to be deleted
    var row = button.parentNode.parentNode;
    // Remove the row from the table
    row.parentNode.removeChild(row);
}
