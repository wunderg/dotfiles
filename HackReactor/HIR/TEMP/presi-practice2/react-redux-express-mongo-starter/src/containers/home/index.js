import React, { Component, PropTypes } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

class Home extends Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
  }

  render() {
    return (
      <div className="row">
      </div>
    );
  }
}

Home.propTypes = {
  router: PropTypes.object
};

function mapStateToProps(state) {
  return {
    data: state
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {}, dispatch);
}

Home.propTypes = {
};

export default connect(mapStateToProps, mapDispatchToProps)(Home);
