// import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h3>我是 Home 页面</h3>
    </div>
  );
}

function About() {
  return (
    <div>
      <h3>我是 About 页面</h3>
    </div>
  );
}

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<Home />} />
          <Route path='about' element={<About />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
