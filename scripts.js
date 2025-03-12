let rowToDelete = null;
let cityToDelete = '';

function openModal(button) {
    // Get the row to be deleted
    rowToDelete = button.parentNode.parentNode;
    cityToDelete = rowToDelete.querySelector('.city').innerText;

    // Show the modal
    var modal = document.getElementById('modal');
    modal.style.display = 'block';
}

function closeModal() {
    var modal = document.getElementById('modal');
    modal.style.display = 'none';
}

function confirmDelete() {
    if (rowToDelete) {
        // Remove the row from the table
        rowToDelete.parentNode.removeChild(rowToDelete);

        // Show the toast notification
        showToast(cityToDelete);

        // Reset the variables
        rowToDelete = null;
        cityToDelete = '';
    }
    closeModal();
}

function showToast(city) {
    var toast = document.getElementById("toast");
    toast.innerText = `Row with city ${city} deleted successfully!`;
    toast.className = "toast show";
    setTimeout(function() {
        toast.className = toast.className.replace("show", "");
    }, 3000);
}

// Close the modal if the user clicks outside of it
window.onclick = function(event) {
    var modal = document.getElementById('modal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

// Attach the confirmDelete function to the OK button
document.getElementById('confirmDelete').onclick = confirmDelete;
