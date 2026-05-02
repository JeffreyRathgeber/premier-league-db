function loadReferees() {
    apiFetch('/referees').then(referees => {
        const tbody = document.getElementById('referees-body');
        tbody.innerHTML = '';
        referees.forEach(r => {
            tbody.innerHTML += `
                <tr id="row-${r.referee_id}">
                    <td>${r.referee_id}</td>
                    <td>${r.first_name}</td>
                    <td>${r.last_name}</td>
                    <td>${r.nationality}</td>
                    <td>
                        <button onclick="editReferee(${r.referee_id}, '${r.first_name}', '${r.last_name}', '${r.nationality}')">Edit</button>
                        <button onclick="deleteReferee(${r.referee_id})">Delete</button>
                    </td>
                </tr>
            `;
        });
    });
}

function editReferee(id, first_name, last_name, nationality) {
    const row = document.getElementById(`row-${id}`);
    row.innerHTML = `
        <td>${id}</td>
        <td><input value="${first_name}"></td>
        <td><input value="${last_name}"></td>
        <td><input value="${nationality}"></td>
        <td>
            <button onclick="saveReferee(${id}, this)">Save</button>
            <button onclick="loadReferees()">Cancel</button>
        </td>
    `;
}

function saveReferee(id, btn) {
    const cells = btn.closest('tr').querySelectorAll('td input');
    const data = {
        first_name: cells[0].value,
        last_name: cells[1].value,
        nationality: cells[2].value
    };

    apiFetch(`/referees/${id}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadReferees());
}

function createReferee() {
    const data = {
        first_name: document.getElementById('first_name').value,
        last_name: document.getElementById('last_name').value,
        nationality: document.getElementById('nationality').value
    };

    apiFetch('/referees', {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => loadReferees());
}

function deleteReferee(id) {
    apiFetch(`/referees/${id}`, { method: 'DELETE' })
        .then(() => loadReferees())
        .catch(() => {});
}

loadReferees();
