function loadManagers() {
    apiFetch('/managers').then(managers => {
        const tbody = document.getElementById('managers-body');
        tbody.innerHTML = '';
        managers.forEach(m => {
            tbody.innerHTML += `
                <tr id="row-${m.manager_id}">
                    <td>${m.manager_id}</td>
                    <td>${m.first_name}</td>
                    <td>${m.last_name}</td>
                    <td>${m.nationality}</td>
                    <td>
                        <button onclick="editManager(${m.manager_id}, '${m.first_name}', '${m.last_name}', '${m.nationality}')">Edit</button>
                        <button onclick="deleteManager(${m.manager_id})">Delete</button>
                    </td>
                </tr>
            `;
        });
    });
}

function editManager(id, first_name, last_name, nationality) {
    const row = document.getElementById(`row-${id}`);
    row.innerHTML = `
        <td>${id}</td>
        <td><input value="${first_name}"></td>
        <td><input value="${last_name}"></td>
        <td><input value="${nationality}"></td>
        <td>
            <button onclick="saveManager(${id}, this)">Save</button>
            <button onclick="loadManagers()">Cancel</button>
        </td>
    `;
}

function saveManager(id, btn) {
    const cells = btn.closest('tr').querySelectorAll('td input');
    const data = {
        first_name: cells[0].value,
        last_name: cells[1].value,
        nationality: cells[2].value
    };

    apiFetch(`/managers/${id}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadManagers());
}

function createManager() {
    const data = {
        first_name: document.getElementById('first_name').value,
        last_name: document.getElementById('last_name').value,
        nationality: document.getElementById('nationality').value
    };

    apiFetch('/managers', {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => loadManagers());
}

function deleteManager(id) {
    apiFetch(`/managers/${id}`, { method: 'DELETE' })
        .then(() => loadManagers())
        .catch(() => {});
}

loadManagers();
