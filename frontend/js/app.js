document.addEventListener('DOMContentLoaded', function() {
    const user = JSON.parse(localStorage.getItem('user'));

    if (user) {
        const userInfo = document.getElementById('user-info');
        if (userInfo) {
            userInfo.innerHTML = `Logged in as: ${user.username}`;
        }

        const adminActions = document.getElementById('admin-actions');
        if (user.rol === 'admin' && adminActions) {
            adminActions.style.display = 'block';
        }
    }

    const logoutButton = document.getElementById('logoutButton');
    if (logoutButton) {
        logoutButton.addEventListener('click', function() {
            localStorage.removeItem('user');
            window.location.href = '../html/login.html';
        });
    }

    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const email = document.getElementById('email').value;

            fetch('http://localhost:8080/auth/register', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password, email })
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Error en el registro');
                    }
                })
                .then(data => {
                    alert('Registro exitoso');
                    // Redirigir al login después del registro
                    window.location.href = 'login.html';
                })
                .catch(error => {
                    alert(error.message);
                });
        });
    }

    const productForm = document.getElementById('editProductForm');
    if (productForm) {
        productForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const id = document.getElementById('editProductId').value;
            const name = document.getElementById('editProductName').value;
            const description = document.getElementById('editProductDescription').value;
            const price = document.getElementById('editProductPrice').value;
            const categoryId = document.getElementById('editProductCategory').value;

            if (!categoryId || categoryId === "undefined") {
                alert("Por favor, selecciona una categoría válida.");
                return;
            }

            fetch(`http://localhost:8080/producto/${id}`, {
                method: 'PUT',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({
                    id_producto: id,
                    nombre: name,
                    descripcion: description,
                    precio: price,
                    idCategoria: categoryId
                })
            }).then(response => {
                if (response.ok) {
                    alert('Producto actualizado exitosamente');
                    viewProducts();
                    productForm.style.display = 'none';
                } else {
                    alert('Error al actualizar el producto');
                }
            }).catch(error => {
                console.error('Error:', error);
                alert('Error al actualizar el producto');
            });
        });
    }

    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            fetch('http://localhost:8080/auth/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password })
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Credenciales inválidas');
                    }
                })
                .then(user => {
                    localStorage.setItem('user', JSON.stringify(user));
                    if (user.role === 'admin') {
                        window.location.href = '../html/admin.html';
                    } else {
                        window.location.href = '../html/productos.html';
                    }
                })
                .catch(error => {
                    alert(error.message);
                });
        });
    }


    const userForm = document.getElementById('editUserForm');
    if (userForm) {
        userForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const id = document.getElementById('editUserId').value;
            const username = document.getElementById('editUsername').value;
            const email = document.getElementById('editUserEmail').value;
            const role = document.getElementById('editUserRole').value;
            const password = document.getElementById('editUserPassword').value;

            fetch(`http://localhost:8080/usuarios/${id}`, {
                method: 'PUT',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({
                    id: id,
                    nombreUsuario: username,
                    correoElectronico: email,
                    rol: role,
                    contrasena: password
                })
            }).then(response => {
                if (response.ok) {
                    alert('Usuario actualizado exitosamente');
                    viewUsers();
                    userForm.style.display = 'none';
                } else {
                    alert('Error al actualizar el usuario');
                }
            }).catch(error => {
                console.error('Error al actualizar el usuario:', error);
                alert('Error al actualizar el usuario');
            });
        });
    }
});

function viewInventory() {
    fetch('http://localhost:8080/inventario-productos')
        .then(response => response.json())
        .then(data => {
            const inventorySection = document.getElementById('inventorySection');
            const inventoryTable = document.getElementById('inventoryTable').querySelector('tbody');
            inventoryTable.innerHTML = '';

            data.forEach(item => {
                if (item.idInventario !== undefined) {
                    const row = `<tr>
                            <td>${item.producto}</td>
                            <td>${item.cantidad}</td>
                            <td>
                                <button onclick="editInventory(${item.idInventario}, '${item.producto}', ${item.cantidad})">Edit</button>
                                <button onclick="deleteInventory(${item.idInventario})">Delete</button>
                            </td>
                        </tr>`;
                    inventoryTable.innerHTML += row;
                } else {
                    console.error('El ID es undefined para el item:', item);
                }
            });

            inventorySection.style.display = 'block';
        })
        .catch(error => {
            console.error('Error al cargar el inventario:', error);
        });
}

function editInventory(id, producto, cantidad) {
    console.log('Editing inventory with id:', id);

    fetch(`http://localhost:8080/inventario/${id}`)
        .then(response => response.json())
        .then(data => {
            const newCantidad = prompt(`Edit quantity for ${producto}:`, data.cantidad);

            if (newCantidad !== null) {
                fetch(`http://localhost:8080/inventario/${id}`, {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        idInventario: data.idInventario,
                        idProducto: data.idProducto,
                        cantidad: newCantidad
                    })
                })
                    .then(response => {
                        if (response.ok) {
                            alert('Cantidad actualizada exitosamente');
                            viewInventory();
                        } else {
                            alert('Error al actualizar la cantidad');
                        }
                    })
                    .catch(error => {
                        console.error('Error al actualizar el inventario:', error);
                        alert('Error al actualizar el inventario');
                    });
            }
        })
        .catch(error => {
            console.error('Error al obtener el inventario:', error);
            alert('Error al obtener el inventario');
        });
}



function deleteInventory(id) {
    if (confirm('Are you sure you want to delete this inventory item?')) {
        fetch(`http://localhost:8080/inventario/${id}`, {
            method: 'DELETE'
        })
            .then(response => {
                if (response.ok) {
                    alert('Item eliminado exitosamente');
                    viewInventory();
                } else {
                    alert('Error al eliminar el item');
                }
            })
            .catch(error => {
                console.error('Error al eliminar el inventario:', error);
                alert('Error al eliminar el inventario');
            });
    }
}



function showAddProductForm() {
    loadCategories();
    document.getElementById('addProductForm').style.display = 'block';
}

document.getElementById('addProductForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const name = document.getElementById('addProductName').value;
    const description = document.getElementById('addProductDescription').value;
    const price = document.getElementById('addProductPrice').value;
    const categoryId = document.getElementById('addProductCategory').value;

    fetch('http://localhost:8080/producto', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            nombre: name,
            descripcion: description,
            precio: price,
            idCategoria: categoryId
        })
    }).then(response => {
        if (response.ok) {
            alert('Producto agregado exitosamente');
            viewProducts();
            document.getElementById('addProductForm').reset();
            document.getElementById('addProductForm').style.display = 'none';
        } else {
            alert('Error al agregar el producto');
        }
    }).catch(error => {
        console.error('Error:', error);
        alert('Error al agregar el producto');
    });
});






function viewUsers() {
    fetch('http://localhost:8080/usuarios/list')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('admin-container');
            container.innerHTML = '';
            data.forEach(user => {
                container.innerHTML += `<div class="user">
                <h3>${user.username}</h3>
                <p>Email: ${user.email}</p>
                <button onclick="editUser('${user.username}')">Edit</button>
                <button onclick="deleteUser(${user.id})">Delete</button>
            </div>`;
            });
        });
}

function viewOrders() {
    fetch('http://localhost:8080/pedidos-usuarios')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('admin-container');
            container.innerHTML = '';
            data.forEach(order => {
                container.innerHTML += `<div class="order">
                <h3>Pedido #${order.idPedido}</h3>
                <p>Total: $${order.total}</p>
                <p>Fecha: ${order.fechaCreacion}</p>
                <button onclick="editOrder(${order.idPedido})">Edit</button>
                <button onclick="deleteOrder(${order.idPedido})">Delete</button>
            </div>`;
            });
        });
}

function viewProducts() {
    fetch('http://localhost:8080/producto/productos')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('admin-container');
            container.innerHTML = '';
            data.forEach(product => {
                container.innerHTML += `<div class="product">
                <h3>${product.nombre}</h3>
                <p>${product.descripcion}</p>
                <p>$${product.precio}</p>
                <button onclick="editProduct(${product.id})">Edit</button>
                <button onclick="deleteProduct(${product.id})">Delete</button>
            </div>`;
            });
        });
}


function viewProductsUser() {
    fetch('http://localhost:8080/producto/productos')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('products-container');
            container.innerHTML = '';
            data.forEach(product => {
                container.innerHTML += `<div class="product">
                    <h3>${product.nombre}</h3>
                    <p>${product.descripcion}</p>
                    <p>$${product.precio}</p>
                    <button onclick="addToCart(${product.id}, '${product.nombre}', ${product.precio})">Añadir al Carrito</button>
                </div>`;
            });
        })
        .catch(error => {
            console.error('Error al cargar los productos:', error);
        });
}



function updateCartCount() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartCount = cart.reduce((total, item) => total + item.quantity, 0);
    document.getElementById('cart-count').textContent = `Carrito: ${cartCount} artículos`;
}

function addToCart(productId, productName, productPrice) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    const existingProduct = cart.find(item => item.id === productId);

    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        const newProduct = {
            id: productId,
            name: productName,
            price: productPrice,
            quantity: 1
        };
        cart.push(newProduct);
    }

    localStorage.setItem('cart', JSON.stringify(cart));

    updateCartCount();
    alert(`${productName} ha sido añadido al carrito.`);
}

function viewCart() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartContainer = document.getElementById('cart-container');
    cartContainer.innerHTML = '';

    if (cart.length > 0) {
        cart.forEach(item => {
            cartContainer.innerHTML += `<div class="cart-item">
                <h4>${item.name}</h4>
                <p>Precio: $${item.price}</p>
                <p>Cantidad: ${item.quantity}</p>
            </div>`;
        });
        cartContainer.style.display = 'block';
    } else {
        cartContainer.innerHTML = '<p>Tu carrito está vacío.</p>';
        cartContainer.style.display = 'block';
    }
}





function editUser(username) {
    fetch(`http://localhost:8080/usuarios/${username}`)
        .then(response => response.json())
        .then(user => {
            document.getElementById('editUserId').value = user.id;
            document.getElementById('editUsername').value = user.nombreUsuario;
            document.getElementById('editUserEmail').value = user.correoElectronico;
            document.getElementById('editUserRole').value = user.rol;
            document.getElementById('editUserPassword').value = user.contrasena;

            document.getElementById('editUserForm').style.display = 'block';
        })
        .catch(error => {
            console.error('Error al obtener el usuario:', error);
        });
}


function deleteUser(id) {
    if (confirm('Are you sure you want to delete this user?')) {
        fetch(`http://localhost:8080/usuarios/${id}`, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                alert('User deleted successfully');
                viewUsers();
            } else {
                alert('Failed to delete user');
            }
        });
    }
}

function deleteOrder(id) {
    if (confirm('Are you sure you want to delete this order?')) {
        fetch(`http://localhost:8080/pedidos/${id}`, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                alert('Order deleted successfully');
                viewOrders();
            } else {
                alert('Failed to delete order');
            }
        });
    }
}

function loadCategories() {
    fetch('http://localhost:8080/categorias/list')
        .then(response => response.json())
        .then(data => {
            const categorySelects = document.querySelectorAll('select[id$="ProductCategory"]');
            categorySelects.forEach(select => {
                select.innerHTML = '';
                data.forEach(category => {
                    select.innerHTML += `<option value="${category.id}">${category.nombre}</option>`;
                });
            });
        })
        .catch(error => {
            console.error('Error al cargar las categorías:', error);
        });
}


function editProduct(id) {
    fetch(`http://localhost:8080/producto/${id}`)
        .then(response => response.json())
        .then(product => {
            document.getElementById('editProductId').value = product.id;
            document.getElementById('editProductName').value = product.nombre;
            document.getElementById('editProductDescription').value = product.descripcion;
            document.getElementById('editProductPrice').value = product.precio;

            loadCategories();

            setTimeout(() => {
                document.getElementById('editProductCategory').value = product.idCategoria;
            }, 500);

            document.getElementById('editProductForm').style.display = 'block';
        })
        .catch(error => {
            console.error('Error al cargar el producto:', error);
        });
}

function deleteProduct(id) {
    if (confirm('Are you sure you want to delete this product?')) {
        fetch(`http://localhost:8080/producto/${id}`, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                alert('Product deleted successfully');
                viewProducts();
            } else {
                alert('Failed to delete product');
            }
        });
    }
}


