import React from 'react'
import { CopyToClipboard } from 'react-copy-to-clipboard';
const classNames = require('classnames')

class LinkForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleCopy = this.handleCopy.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
        editHash: "",
        isLoaded: false,
        inputLink: ""
    };
  }

  handleChange(e) {
    const target = e.target;
    const value = target.value;
    const name = target.name;

    this.setState({
      [name] : value
    });

  }

  handleCopy(e) {
    e.preventDefault();
    var copyText = document.querySelector("#inputLink");
    copyText.select();
    document.execCommand("copy");
  }

  handleClick(e) {
    e.preventDefault();
  }

  handleSubmit(e) {
    e.preventDefault();
    let component = this;
    let formData = new FormData(e.target);
    console.log(formData)
    let data = {
      "link": {
          "url": formData.get('inputLink'),
      }
    };
    fetch("/api/links", {
        method: 'POST',
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
    })
      .then(res => res.json())
      .then(
        (result) => {
            console.log(result)
          component.setState({
            isLoaded: true,
            editHash: result.data.hash
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }

  render() {
    var hasHash = this.state.editHash && this.state.isLoaded
    var shortLinkGroupClass = classNames({
          'form-inline': true,
          'hidden': !hasHash
        });
    var formClass = classNames({
        'form-inline': true,
        'hidden': hasHash
    });
    var shortLink = `${window.location.origin}/${this.state.editHash}`
    return (
    <div>
      <form onSubmit={this.handleSubmit} className={formClass}>
        <input onChange={this.handleChange} type="text" id="inputLink" name="inputLink" className="form-control" value={this.state.inputLink} placeholder="Link to shrink"/>
        <button disabled={!this.state.inputLink} className="btn btn-primary" type="submit">Make it tiny!</button>
      </form>
      <div className={shortLinkGroupClass}>
        <input readOnly id="shortLink" className="form-control" value={shortLink} />
        <CopyToClipboard text={shortLink}>
          <button className="btn btn-primary">Copy</button>
        </CopyToClipboard>
      </div>
    </div>
    );
  }
}

export default LinkForm;