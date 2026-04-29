const API = 'http://127.0.0.1:5000';

function apiFetch(path, options = {}) {
    return fetch(`${API}${path}`, {
        headers: { 'Content-Type': 'application/json' },
        ...options
    }).then(res => {
        return res.json().then(data => {
            if (!res.ok) {
                alert(data.error || `Request failed: ${res.status}`);
                throw new Error(data.error);
            }
            return data;
        });
    });
}
