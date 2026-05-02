function loadRefereeWorkload() {
    apiFetch('/referee-workload').then(rows => {
        const tbody = document.getElementById('referee-workload-body');
        tbody.innerHTML = '';
        rows.forEach(r => {
            tbody.innerHTML += `
                <tr>
                    <td>${r.first_name} ${r.last_name}</td>
                    <td>${r.nationality ?? ''}</td>
                    <td>${r.matches_officiated}</td>
                    <td>${r.avg_attendance != null ? Number(r.avg_attendance).toLocaleString() : ''}</td>
                    <td>${r.total_goals_overseen}</td>
                </tr>
            `;
        });
    });
}

loadRefereeWorkload();
