import React from 'react';
import {BrowserRouter as Router} from 'react-router-dom';
import {Header} from './components/Header';
import {Footer} from './components/Footer';

export default function App() {
  return (
    <Router>
      <Header/>
      <Footer/>
    </Router>
  );
}
