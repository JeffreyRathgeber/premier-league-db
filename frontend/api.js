const API = 'http://127.0.0.1:5000';

function apiFetch(path, options = {}) {
    return fetch(`${API}${path}`, {
        headers: { 'Content-Type': 'application/json' },
        ...options
    }).then(res => {
        if (!res.ok) throw new Error(`${options.method || 'GET'} ${path} failed: ${res.status}`);
        return res.json();
    });
}
