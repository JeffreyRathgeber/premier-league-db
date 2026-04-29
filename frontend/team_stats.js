const params = new URLSearchParams(window.location.search);
const teamId = params.get('team_id');

if (!teamId) {
    document.getElementById('stats-container').innerHTML = '<p>No team specified.</p>';
} else {
    apiFetch(`/teams/${teamId}`)
        .then(team => {
            document.getElementById('page-title').textContent = `${team.name} — Stats`;
        })
        .catch(() => {});

    loadStats();
}

function loadStats() {
    apiFetch(`/teams/${teamId}/stats`).then(stats => {
        const tbody = document.getElementById('stats-body');
        tbody.innerHTML = '';
        stats.forEach(s => {
            tbody.innerHTML += `
                <tr id="stat-row-${s.stat_id}">
                    <td>${s.stat_name}</td>
                    <td>${s.stat_value}</td>
                    <td>
                        <button onclick="editStat(${s.stat_id}, '${s.stat_name}', ${s.stat_value})">Edit</button>
                        <button onclick="deleteStat(${s.stat_id})">Delete</button>
                    </td>
                </tr>
            `;
        });
    });
}

function editStat(stat_id, stat_name, stat_value) {
    const row = document.getElementById(`stat-row-${stat_id}`);
    row.innerHTML = `
        <td><input value="${stat_name}"></td>
        <td><input type="number" step="any" value="${stat_value}"></td>
        <td>
            <button onclick="saveStat(${stat_id}, this)">Save</button>
            <button onclick="loadStats()">Cancel</button>
        </td>
    `;
}

function saveStat(stat_id, btn) {
    const cells = btn.closest('tr').querySelectorAll('td input');
    const data = {
        stat_name: cells[0].value,
        stat_value: parseFloat(cells[1].value)
    };

    apiFetch(`/teams/${teamId}/stats/${stat_id}`, {
        method: 'PUT',
        body: JSON.stringify(data)
    }).then(() => loadStats());
}

function addStat() {
    const data = {
        stat_name: document.getElementById('new_stat_name').value,
        stat_value: parseFloat(document.getElementById('new_stat_value').value)
    };

    if (!data.stat_name || isNaN(data.stat_value)) {
        alert('Please enter a stat name and value.');
        return;
    }

    apiFetch(`/teams/${teamId}/stats`, {
        method: 'POST',
        body: JSON.stringify(data)
    }).then(() => {
        document.getElementById('new_stat_name').value = '';
        document.getElementById('new_stat_value').value = '';
        loadStats();
    });
}

function deleteStat(stat_id) {
    apiFetch(`/teams/${teamId}/stats/${stat_id}`, { method: 'DELETE' })
        .then(() => loadStats());
}
