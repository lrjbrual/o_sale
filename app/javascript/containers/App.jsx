import React, { Component } from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom' 
// you can use also BrowserRouter as Router
import Header from '../components/shared/Header'
// import Jumbotron from '../components/products/Jumbotron'
import ProductList from './ProductsContainer'
import ProductDetail from './ProductDetailContainer'
import Footer from '../components/shared/Footer'
import NewProductForm from '../components/products/NewProductForm'
// import Product from '../components/products/Product'

class App extends Component {
  render() {
    return (
      <BrowserRouter> 
        <React.Fragment>
          <Header />
          <Switch>
            <Route exact path='/' component={ProductList} />
            <Route path='/products/:id' component={ProductDetail} />
            {/* <Route path='/newProduct' component={NewProductForm} /> */}
            <Route render={() => (
              <div className="container">
                <div className="row">
                  <div className="card col-md-8 offset-md-2 mt-4 form_header-style">
                    <h1 className="text-center m-4" >
                      404: Not Found
                    </h1>
                    <p className="text-center m-4">
                      The resource you are looking for could not be exist
                    </p>
                  </div>
                </div>
              </div>
            )}/>

            // for testing
            {/* <Route path='/jumbo' component={Jumbotron} />
            <Route path='/jumbo/tron' component={Jumbotron} /> */}
          </Switch>
          <Footer />
        </React.Fragment>
      </BrowserRouter>
    )
  }
}

export default App