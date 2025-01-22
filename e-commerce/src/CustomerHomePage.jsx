import React, { useState, useEffect } from 'react';
import { CategoryNavigation } from './CategoryNavigation';
import { ProductList } from './ProductList';
import { Footer } from './Footer';
import { Header } from './Header';
import './assets/styles.css';

export default function CustomerHomePage() {
  const [products, setProducts] = useState([]);
  const [cartCount, setCartCount] = useState(0); // cart count state
  const [username, setUsername] = useState('');
  const [cartError, setCartError] = useState(false); // error state for cart
  const [isCartLoading, setIsCartLoading] = useState(true); // loading state for cart

  useEffect(() => {
    fetchProducts();
    if (username && username !== 'Guest') {
      fetchCartCount(); // Only fetch cart count if username is set
    }
  }, [username]);

  const fetchProducts = async (category = 'Shirts') => {
    try {
      const response = await fetch(`http://localhost:9090/api/products?category=${category}`, {
        credentials: 'include'
      });
      if (!response.ok) {
        throw new Error('Failed to fetch products');
      }
      const data = await response.json();
      setUsername(data.user?.name || 'Guest'); // Set username or 'Guest' if undefined
      setProducts(data.products || []);
    } catch (error) {
      console.error('Error fetching products:', error);
      setProducts([]); // Set products to empty array in case of error
    }
  };

  const fetchCartCount = async () => {
    setIsCartLoading(true);
    try {
      const response = await fetch(`http://localhost:9090/api/cart/items/count?username=${username}`, {
        credentials: 'include'
      });
      if (!response.ok) {
        throw new Error('Failed to fetch cart count');
      }
      const count = await response.json();
      console.log('Cart count received:', count); // Log the cart count for debugging

      if (typeof count === 'number') {
        setCartCount(count);
        setCartError(false);
      } else {
        console.error('Unexpected cart count format:', count);
        setCartCount(0);
        setCartError(true);
      }
    } catch (error) {
      console.error('Error fetching cart count:', error);
      setCartError(true);
      setCartCount(0); // Fallback to zero in case of error
    } finally {
      setIsCartLoading(false);
    }
  };

  const handleCategoryClick = (category) => {
    fetchProducts(category);
  };

  const handleAddToCart = async (productId) => {
    if (!username || username === 'Guest') {
      console.error('Username is required to add items to the cart');
      return;
    }
    try {
      const response = await fetch('http://localhost:9090/api/cart/add', {
        credentials: 'include',
        method: 'POST',
        body: JSON.stringify({ username, productId }),
        headers: { 'Content-Type': 'application/json' }
      });
      if (!response.ok) {
        throw new Error('Failed to add product to cart');
      }
      fetchCartCount(); // Update cart count after adding product
    } catch (error) {
      console.error('Error adding product to cart:', error);
    }
  };

  return (
    <div className="customer-homepage">
      <Header
        cartCount={isCartLoading ? 'Loading...' : cartError ? 'Error' : cartCount} // Handle loading/error states here
        username={username}
      />
      <nav className="navigation">
        <CategoryNavigation onCategoryClick={handleCategoryClick} />
      </nav>
      <main className="main-content">
        <ProductList products={products} onAddToCart={handleAddToCart} />
      </main>
      <Footer />
    </div>
  );
}
