import humps from 'humps';
import api from './api';

export default {
  create(courseId, form) {
    return api({
      method: 'post',
      url: `/courses/${courseId}/lectures`,
      data: form,
    });
  },
};
