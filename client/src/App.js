import logo from "./logo.svg";
import "./App.css";
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";

import OtherPage from "./OtherPage";
import Fib from "./Fib";
// import Home from "./Home";

const LinkStyles = {
  color: "lightblue",
};

function App() {
  return (
    <div className="App">
      <Router>
        <div>
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Welcome to React</h1>
            <Link style={LinkStyles} to="/otherpage">
              Other Page
            </Link>
          </header>
          <Switch>
            <Route exact path="/" component={Fib} />
            <Route exact path="/otherpage" component={OtherPage} />
          </Switch>
        </div>
      </Router>
    </div>
  );
}

export default App;
