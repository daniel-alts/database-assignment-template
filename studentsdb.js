// created collections
db.createCollection('departments')
db.createCollection("users")
db.createCollection('programs')
db.createCollection('courses')
db.createCollection('students')
db.createCollection('student_courses')
db.createCollection('admin')
db.createCollection('student_courses')
db.createCollection('instructors')
db.createCollection('instructor_courses')

// insert data
db.departments.insertOne({ _id: 1, name: 'SOE', descripiton: 'School Of Engineering', created_at: Date() });

// update department
db.departments.update(
  { _id: 1, },
  { $set: { name: 'SOE', descripiton: 'School Of Engineering' } } 
);

// delete department
db.departments.deleteOne(
    { _id: 1, } 
  );

// query data
db.departments.find({ _id: 1 })

db.departments.findOne({ _id: 1 })

// get all programs based on department id
db.programs.aggregate([ { $lookup: { from: 'departments', localField: 'department_id', foreignField: '_id', as :'departments' }}])