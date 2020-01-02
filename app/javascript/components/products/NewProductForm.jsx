import React, { Component } from 'react'

class NewProductForm extends Component {
  // constructor(props) {
  //   super(props)

    // this.state = {
    state = {
      name: '',
      description: '',
      price: '',
      quantity: '',
      errors: {}
    }
    // this can avoid error message this.state to trigger the empty array
    // this.handleSubmit = this.handleSubmit.bind(this)
    //handleChange can also bind inside the return value
    // this.handleChange = this.handleChange.bind(this)
  // }
    handleSubmit = (event) => {
  // change handleSubmit(event) {
    //preventDefault will handle of non refreshing page
    event.preventDefault() 
    // console.log("Handling Submit")
    // console.log(this.state)
    //handler sumbit for new product 
    const { name, description, price, quantity } = this.state
    const newProduct = {
      name, 
      description, 
      price, 
      quantity
    }
    this.props.onSubmit(newProduct)
    //clear the state
    this.setState({
      name: '',
      price: '',
      description: '',
      quantity: ''
    })
  }
  handleChange = (event) => {
    //refactor state this will be use for all input fields
    this.setState({[event.target.name]: event.target.value})
    // this.setState({[event.target.price]: event.target.value})
    // const productObject = {}
    // const productObject = {[event.target.name]: event.target.value}
    //this will target the name to view to add property .name and to refactor via
    // productObject[event.target.name] = event.target.value
    // this.setState(productObject)
    //event target will bind the target .value
    // console.log(productObject)
    // console.log(event.target.value)
  }
  render() {
    const buttonText = "Create Product"
    const title = "Add New Product"
    return (
      <div className="container mb-4">
      <div className="row">
        <div className="col-md-8 offset-md-2">
            <div className="card panel-div">
              <h1 className="text-center form-header-style pt-2 pb-3">
                { title }
              </h1>

              <div className="form-body-style px-5 pt-4">
                <form className="form-horizontal" onSubmit={this.handleSubmit}>
                  <div className="form-group row">
                    <label htmlFor="name" className="col-md-3 col-form-label">Name</label>
                    <div className="col-md-9">
                      <input 
                        type="text" 
                        name="name" 
                        value={this.state.name}
                        onChange={this.handleChange}
                        id="name" 
                        className="form-control" 
                        placeholder="Item name" 
                        autoFocus={true} 
                      />
                    </div>
                  </div>

                  <div className="form-group row">
                    <label htmlFor="price" className="col-md-3 col-form-label">Price</label>
                    <div className="col-md-9">
                      <input 
                        type="number" 
                        name="price" 
                        value={this.state.price}
                        onChange={this.handleChange}
                        id="price" 
                        className="form-control" 
                        placeholder="Item price" 
                      />
                    </div>
                  </div>

                  <div className="form-group row">
                    <label htmlFor="quantity" className="col-md-3 col-form-label">Quantity</label>
                    <div className="col-md-9">
                      <input 
                        type="number" 
                        name="quantity" 
                        value={this.state.quantity}
                        onChange={this.handleChange}
                        id="quantity" 
                        className="form-control" 
                        placeholder="Item qty" 
                      />
                    </div>
                  </div>

                  <div className="form-group row">
                    <label htmlFor="description" className="col-md-3 col-form-label">
                      Description
                    </label>
                    <div className="col-md-9">
                      <textarea 
                        name="description" 
                        value={this.state.description}
                        onChange={this.handleChange}
                        id="description" 
                        className="form-control" 
                        placeholder="Item description here" 
                        rows="5">  
                      </textarea>
                    </div>
                  </div>

                  <div className="form-group row">
                    <label htmlFor="image" className="col-md-3 col-form-label">Image</label>
                    <div className="col-md-9">
                      <input 
                        type="file" 
                        name="image" 
                        id="image" 
                        className="form-control"  
                      />
                    </div>
                  </div>

                  <div className="form-group row">
                    <div className="col-md-9 offset-md-3">
                      <input 
                        type="submit" 
                        className="btn btn-outline-purple" 
                        value={ buttonText } 
                      />
                    </div>
                  </div>

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default NewProductForm