CC = gcc


objs_my_template_arr = ../../my_template_arr/my_string.o ../../my_template_arr/my_struct_arr.o


multi_thread = ./run/multi_thread
CFlags_m = -fopenmp -D_REENTRANT -S -O3 -msse -msse2 -Wall -pedantic #-std=c99
objs_m = do_one_file_m.o main_m.o mtx_mul_m.o my_seq_ops_m.o my_struct_m.o $(objs_my_template_arr)
Include_m = -I./ -I../../my_template_arr/

$(multi_thread) : $(objs_m)
	$(CC) -o $(multi_thread) $(CFlags_m) $(Include_m) $(objs_m)

#multi-thread
do_one_file_m.o: do_one_file.c my_seq_ops.h mtx_mul.h do_one_file.h
	$(CC) -c do_one_file.c $(CFlags_m) $(Include_m) -o do_one_file_m.o
main_m.o: main.c my_seq_ops.h do_one_file.h mtx_mul.h
	$(CC) -c main.c $(CFlags_m) $(Include_m) -o main_m.o
mtx_mul_m.o: mtx_mul.c my_seq_ops.h ../../my_template_arr/my_string.h \
 my_struct.h ../../my_template_arr/my_struct_arr.h my_struct.h mtx_mul.h
	$(CC) -c mtx_mul.c $(CFlags_m) $(Include_m) -o mtx_mul_m.o
my_seq_ops_m.o: my_seq_ops.c my_seq_ops.h
	$(CC) -c my_seq_ops.c $(CFlags_m) $(Include_m) -o my_seq_ops_m.o
my_single_omp_m.o: my_single_omp.c my_single_omp.h
	$(CC) -c my_single_omp.c $(CFlags_m) $(Include_m) -o my_single_omp_m.o
my_struct_m.o: my_struct.c my_struct.h
	$(CC) -c my_struct.c $(CFlags_m) $(Include_m) -o my_struct_m.o


single_thread = ./run/single_thread
CFlags_s = -g -Wall -pedantic -DDEBUG_TEST -lrt#-std=c99
objs_s = do_one_file_s.o main_s.o mtx_mul_s.o my_seq_ops_s.o my_single_omp_s.o my_struct_s.o $(objs_my_template_arr)
Include_s = -I./ -I../../my_template_arr/

$(single_thread) : $(objs_s)
	$(CC) -o $(single_thread) $(CFlags_s) $(Include_s) $(objs_s)


#single-thread
do_one_file_s.o: do_one_file.c my_single_omp.h my_seq_ops.h mtx_mul.h \
 do_one_file.h
	$(CC) -c do_one_file.c $(CFlags_s) $(Include_s) -o do_one_file_s.o
main_s.o: main.c my_single_omp.h my_seq_ops.h do_one_file.h mtx_mul.h
	$(CC) -c main.c $(CFlags_s) $(Include_s) -o main_s.o
mtx_mul_s.o: mtx_mul.c my_single_omp.h my_seq_ops.h \
 ../../my_template_arr/my_string.h my_struct.h \
 ../../my_template_arr/my_struct_arr.h my_struct.h mtx_mul.h
	$(CC) -c mtx_mul.c $(CFlags_s) $(Include_s) -o mtx_mul_s.o
my_seq_ops_s.o: my_seq_ops.c my_seq_ops.h
	$(CC) -c my_seq_ops.c $(CFlags_s) $(Include_s) -o my_seq_ops_s.o
my_single_omp_s.o: my_single_omp.c my_single_omp.h
	$(CC) -c my_single_omp.c $(CFlags_s) $(Include_s) -o my_single_omp_s.o
my_struct_s.o: my_struct.c my_struct.h
	$(CC) -c my_struct.c $(CFlags_s) $(Include_s) -o my_struct_s.o


.PHONY : all
all: $(multi_thread) $(single_thread)

.PHONY : m_th
m_th: $(multi_thread)

.PHONY : s_th
s_th: $(single_thread)

.PHONY : clean
clean:
	rm -rf *.o


../../my_template_arr/my_string.o: ../../my_template_arr/my_string.h
	$(CC) -c ../../my_template_arr/my_string.c $(CFlags_s) $(Include_s) -o ../../my_template_arr/my_string.o
../../my_template_arr/my_struct_arr.o: ../../my_template_arr/my_struct_arr.h
	$(CC) -c ../../my_template_arr/my_struct_arr.c $(CFlags_s) $(Include_s) -o ../../my_template_arr/my_struct_arr.o



